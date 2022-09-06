Rails.application.routes.draw do
  devise_for :users
  root to: "weddings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pages, :weddings

  # Defines the root path route ("/")
  # root "articles#index"

end
