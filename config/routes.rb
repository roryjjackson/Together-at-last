Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :weddings do
    resources :pages, only: [ :new, :create ]
    resources :schedules, only: [ :new, :create ]
    resources :rsvps, only: [ :new, :create ]
    resources :accomodation_infos, only: [ :new, :create ]
  end
  resources :schedules, only: [ :index, :show ]
  resources :rsvps, only: [ :index, :show ]
  # resources :pages, :weddings, :schedules, :rsvps
  # Defines the root path route ("/")
  # root "articles#index"
end
