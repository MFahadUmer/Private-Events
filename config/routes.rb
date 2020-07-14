Rails.application.routes.draw do
  get "sign_in", to: "users#sign_in"
  get "user_logout", to: "users#user_logout"
  # resources :users, only: [:show, :create, :new]
  resources :users
  resources :events
  resources :sign_in
  root 'users#index'
end
