Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "movies#index"
  post 'votes', to: 'votes#create', as: :votes
  delete 'votes/:id', to: 'votes#destroy', as: :vote
  get 'movies/new', as: :new_movie
  post 'movies', to: 'movies#create'
  get 'movies', to: 'movies#index'
  post 'sessions/create', as: :sign_in
  delete 'sessions/destroy', as: :logout
end
