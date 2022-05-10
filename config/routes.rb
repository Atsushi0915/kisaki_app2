Rails.application.routes.draw do
  get 'comments/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root to: 'posts#top'
  resources :posts
  resources :users
end
