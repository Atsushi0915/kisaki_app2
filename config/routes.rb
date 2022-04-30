Rails.application.routes.draw do
  get 'sessions/new'
  get 'posts/top'
  get 'posts/new'
  get 'posts/show'
  get 'posts/index'
  get 'posts/edit'
  get 'users/new'
  get 'users/show'
  get 'users/index'
  get 'users/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
