Rails.application.routes.draw do
  get 'comments/new'
  post 'comments/create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root to: 'posts#top'
  resources :posts
  resources :users
end
