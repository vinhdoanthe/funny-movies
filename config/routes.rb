Rails.application.routes.draw do
  get 'movies/new', as: :new_movie
  post 'movies', to: 'movies#create'
  get 'movies', to: 'movies#index'
  post 'sessions/create', as: :sign_in
  delete 'sessions/destroy', as: :logout
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "movies#index"
end
