class PaymentsController < ApplicationController
    # Remove need for security token. Only used here as test payments are being used. 
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success
    end

    # Function for receiving payment information from the stripe API through a webhook
    def webhook
        # Parse data from the webhook
        payment_id= params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        listing_id = payment.metadata.listing_id
        user_id = payment.metadata.user_id
    
        # Return listing and user information to the Rails console
        p "listing id " + listing_id
        p "user id " + user_id
    
        # Send a Status 'ok' message to webhook origin
        status 200
    end
end