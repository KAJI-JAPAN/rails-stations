Rails.application.routes.draw do
  # get 'movies', to: 'movies#index'
  resources :reservations, only: [  :create]
  scope :admin do
    get 'search', to: 'movies#search'
    resources :schedules, only: [:index]
    resources :movies do
      resources :schedules, except: [:index] do
        resources :sheets
        resources :reservations, except: [:create]
      end
    end
  end
end
