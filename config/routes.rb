Rails.application.routes.draw do
  # get 'movies', to: 'movies#index'
  scope :admin do
    resources :movies
    get 'search', to: 'movies#search'
  end
end
