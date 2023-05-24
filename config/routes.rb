Rails.application.routes.draw do
  devise_for :users
  namespace :user do
    resources :products do
      collection do
        get "export_csv"
      end
    end
    resources :admins
    resources :categories
  end
  root "home#index"

  get "users/export"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
