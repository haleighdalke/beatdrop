Rails.application.routes.draw do
  resources :users
  resources :plays
  resources :genres
  resources :songs
  resources :artists

  get '/artists/login', to 'auth#artist_login', as: 'artist_login'
  get '/artists/:id/home', to: 'artists#home', as: 'home'

  get '/login', to: 'auth#login', as: 'login'
  post '/login', to: 'auth#verify_username'

  get '/logout', to: 'auth#logout', as: 'logout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
