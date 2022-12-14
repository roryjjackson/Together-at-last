Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :weddings do
    resources :pages, only: %i[new create]
    resources :schedules, only: %i[index show new create]
    resources :rsvps, only: %i[new create index show]
    resources :wedding_guests, only: %i[create]

    resources :accomodation_info

    resources :vips, only: %i[new create show index update edit]

  end
  resources :vips, only: %i[destroy]
  # resources :schedules, only: %i[index show]
  # resources :rsvps, only: %i[]

  # resources :pages, :weddings, :schedules, :rsvps
  # Defines the root path route ("/")
  # root "articles#index"
end
