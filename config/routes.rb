Rails.application.routes.draw do

  root "users#index"

  get '/session', to: "session#show"
  put '/session', to: "session#update"
  resources :session, only: [:new, :create]

end
