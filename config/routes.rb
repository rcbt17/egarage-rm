Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/cars/manage', to: "cars#manage", as: :manage_cars
  resources :cars do
    resources :bookings, only: %i[ new create]
  end
  resources :bookings, only: %i[index show destroy]
  # Defines the root path route ("/")
  # root "articlndex"
end
