Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :therapists, only: [:index, :show, :edit, :update] do
    resources :bookings, only: [:index, :new, :create]
    resources :messages, only: [:new, :create]
  end
  resources :bookings, only: [:show, :edit, :update, :destroy] do
    resources :notes, only: [:new, :create]
  end
  resources :articles, only: [:index, :show]
  get '/dashboard', to: 'pages#dashboard'
end
