Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :user, only: [:edit, :update]
  resources :items, only: [:index, :new]
end
