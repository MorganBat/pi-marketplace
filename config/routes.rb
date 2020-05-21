Rails.application.routes.draw do
  # Create route to receive payment webhook from stripe
  post "/payments/webhook", to: "payments#webhook"
  # Sets devise to handle all user views
  devise_for :users
  # Routes root to listings index
  get "/", to: "listings#index"
  root to: 'listings#index'
  # Custom route, not handled by Rails magic. Used for the user to access all their listings
  get "/listings/user", to: "listings#user", as: :user_listings
  # Rails magic to user listings controller for all listings routes
  resources :listings
  # Page for after a successful payment has been received by Stripe.
  get "/payments/success", to: "payments#success"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
