Rails.application.routes.draw do
  devise_for :users
  root to: "weddings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :weddings do
    resources :pages, only: %i[new create]
    resources :schedules, only: %i[new create]
    resources :rsvps, only: %i[new create]
    resources :wedding_guests, only: %i[create]
  end
  resources :schedules, only: %i[index show]
  resources :rsvps, only: %i[index show]

  # resources :pages, :weddings, :schedules, :rsvps
  # Defines the root path route ("/")
  # root "articles#index"
end
