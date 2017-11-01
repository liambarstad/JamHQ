Rails.application.routes.draw do

  root "users#index"

  get '/session', to: "session#show"
  resources :session, only: [:new, :update, :create]

end
