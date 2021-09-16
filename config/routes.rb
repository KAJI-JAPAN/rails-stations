Rails.application.routes.draw do
  # get 'movies', to: 'movies#index'
  get '/admin/movies', to: 'movies#index'
  get '/admin/movies/new', to: 'movies#new'
  post '/admin/movies/new', to: 'movies#create'
end
