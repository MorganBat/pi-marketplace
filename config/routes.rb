Rails.application.routes.draw do
  post "/payments/webhook", to: "payments#webhook"
  devise_for :users
  get "/", to: "listings#index"
  root to: 'listings#index'
  get "/listings/user", to: "listings#user", as: :user_listings
  resources :listings
  get "/payments/success", to: "payments#success"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
