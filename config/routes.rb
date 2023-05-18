Rails.application.routes.draw do
  resources :admins, only: [:new, :create]

  devise_for :users
  root "home#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
