Rails.application.routes.draw do
  get 'videos/new'
  get 'videos/create'
  get 'videos/index'
  get 'sessions/create'
  get 'sessions/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
