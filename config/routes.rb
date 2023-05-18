Rails.application.routes.draw do
  resources :admins, only: [:index, :new, :create]

  devise_for :users
  root "home#index"

  get "users/export"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
