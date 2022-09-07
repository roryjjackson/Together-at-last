Rails.application.routes.draw do
  devise_for :users
  root to: "weddings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :weddings do
    resources :pages, only: [ :new, :create ]
    resources :schedules, only: [ :new, :create ]
    resources :rsvps, only: [ :new, :create ]
    resources :accomodation_infos, only: [ :new, :create ]
  end
  resources :schedules, only: [ :index, :show ]
  resources :rsvps, only: [ :index, :show ]
  resources :accomodation_info, only: [ :index, :show,  :new]

  # resources :pages, :weddings, :schedules, :rsvps
  # Defines the root path route ("/")
  # root "articles#index"
end
