class ListingsController < ApplicationController
  # Authenticate user before applying any CRUD.
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  # Access set_user_listings method for operations where the user wants to access their own listings
  before_action :set_user_listings, only: %i[edit update destroy]
  # Access set_listing method before operations where a particular listing is being accessed
  before_action :set_listing, only: %i[show edit update destroy]
  # Before creating or editing a listing, access the Array of model types.
  before_action :set_models, only: %i[new edit]

  # GET /listings
  # GET /listings.json
  def index
    # Get all user accounts to display seller information on index
    @sellers = User.all
    # Set up search functionality for ransack
    @search = Listing.ransack(params[:q])
    @listings = @search.result
    @search.build_condition
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    # Get seller information for listing
    @seller = User.find_by_id(@listing.user_id)
    # Check if user is is signed in before initiatiing Strip session
    if user_signed_in?
      # Initiate stripe session
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: @listing.name,
            description: @listing.description,
            amount: (@listing.price * 100).to_i,
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
                listing_id: @listing.id
            }
        },
        success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
        cancel_url: "#{root_url}listings"
      )

      @session_id = session.id
      end
  end

  # GET /listings/new
  def new
    @listing = current_user.listings.new
  end

  # GET /listings/1/edit
  def edit
    # User authentication. Redirects user away from edit page if they're trying to access a listing which isn't theirs.
    if user_signed_in? && current_user.id != @listing.user_id
      redirect_to listings_path
    end
  end

  # POST /listings
  # POST /listings.json
  def create
    # Create a new listing
    @listing = current_user.listings.new(listing_params)

    # Check whether format is valid and return a different message based on whether creation was successful or not.
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    # Return a message based on whether editing was successful or not
    respond_to do |format|
      if current_user.listings.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    # Only allow users to destroy their own listing
    @listing.destroy if @listing.user_id == current_user.id
    # Return a message on a successful destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user
    # Only access listings which are from the current user
    @listings = current_user.listings
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Accessing all listings associated with the user
    def set_user_listings
      @listing = current_user.listings.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:name, :model, :price, :software, :description, :image)
    end

    # Create an array of Model types for the create and edit functions
    def set_models
      @models = ["4B", "3B+", "3A+", "3", "2", "B", "A+", "Zero WH", "Zero W", "Zero"]
    end
end
