Rails.application.routes.draw do
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :tweets
  resources :likes, only: [:create, :destroy]
  root 'tweets#index'
end
