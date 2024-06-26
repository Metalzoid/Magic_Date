Rails.application.routes.draw do
  get 'favourites/create'
  get 'favourites/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "offers#index" do
    resources :favourites, only: %i[create destroy]
  end
  resources :offers, except: %i[index] do
    resources :bookings, only: %i[create new]
  end
  resources :bookings, only: %i[index destroy update] do
    resources :ratings, only: %i[create new]
  end
end
