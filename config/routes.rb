Rails.application.routes.draw do
  # get 'movies', to: 'movies#index'
  namespace :admin do
    resources :reservations
  end
    get 'search', to: 'movies#search'
    resources :schedules, only: [:index]
    resources :movies do
      resources :schedules, except: [:index] do
        resources :sheets
    end
  end
end
