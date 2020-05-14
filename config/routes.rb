Rails.application.routes.draw do
  devise_for :users
  get "/", to: "listings#index"
  root to: 'listings#index'
  resources :listings
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
