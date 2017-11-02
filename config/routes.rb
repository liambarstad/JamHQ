Rails.application.routes.draw do

  root "users#index"

  get '/session', to: "session#show"
  put '/session', to: "session#update"
  get '/facebook', to: "facebook#update"
  resources :session, only: [:new, :create]

end
