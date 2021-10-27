Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :skates do
    resources :bookings, only: [:new, :create]    
    resources :reviews, only: :create
  end
  resources :reviews, only: :destroy

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
