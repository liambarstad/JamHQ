Rails.application.routes.draw do

  root "users#index"

  get "/session", to: "session#show"
  put "/session", to: "session#update"
  get "/facebook", to: "facebook#update"
  get "/auth/facebook/callback", to: "facebook#create"
  resources :session, only: [:new, :create]

end
