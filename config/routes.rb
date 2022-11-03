Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  post "/items/new"=>"items#create"
  resources :user, only: [:edit, :update]
  resources :items, only: [:index, :new, :create, :show]
end
