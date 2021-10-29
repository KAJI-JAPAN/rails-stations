Rails.application.routes.draw do
  # get 'movies', to: 'movies#index'
  scope :admin do
    resources :reservations
  end
  resources :reservations, only: [:create]
    get 'search', to: 'movies#search'
    resources :schedules, only: [:index]
    resources :movies do
      resources :schedules, except: [:index] do
        resources :sheets
        resources :reservations, except: [:create]
    end
  end
end
