Rails.application.routes.draw do

  root "welcome#index"

  get "/session", to: "session#show"
  put "/session", to: "session#update"
  delete "/session", to: "session#destroy"
  get "/facebook", to: "facebook#update"
  get "/auth/facebook/callback", to: "facebook#create"
  resources :session, only: [:new, :create]

  resources :users, only: [:index, :show]
  resources :venues, only: [:index, :show]
  resources :posts, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      get "/token", to: "token#create"
      resources :posts, only: [:create, :update, :destroy]
      resources :comments, only: [:create, :update, :destroy]
      resources :users, only: [:create, :update, :destroy]
      resources :venues, only: [:create, :update, :destroy]
    end
  end

end
