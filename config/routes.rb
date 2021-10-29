Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :skates do
    resources :bookings, only: [:new, :create, :update, :destroy]
    get "status/:id", to: "bookings#status", as: :status
    resources :reviews, only: :create
  end
  # resources :bookings, only: :destroy
  resources :reviews, only: :destroy

  get "dashboard", to: "pages#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
