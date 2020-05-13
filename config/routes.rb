Rails.application.routes.draw do
  devise_for :users
  get "/", to: "users#index"
  root to: 'users#index'
  resources :listings
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
