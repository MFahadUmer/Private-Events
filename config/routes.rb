Rails.application.routes.draw do
  # resources :users, only: [:show, :create, :new]
  resources :users
  root 'users#index'
end
