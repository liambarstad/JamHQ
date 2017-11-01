Rails.application.routes.draw do

  root "users#index"

  resources :users, only: [:index]
  resources :session, only: [:new, :update, :create, :show]

end
