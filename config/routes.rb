Rails.application.routes.draw do

  # OAuth
  namespace :api do
    namespace :v1 do
      get '/login', to: "auth#spotify_request"
      get '/auth', to: "auth#show"
      get '/user', to: "users#create"
      patch '/user', to: "users#update"
    end
  end

  resources :users
  resources :plays
  resources :genres
  resources :songs
  resources :artists

  # get '/login', to: 'auth#login', as: 'login'
  # post '/login', to: 'auth#verify_username'

  # get '/logout', to: 'auth#logout', as: 'logout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
