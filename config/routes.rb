Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :items, only: :order do
    post 'order', on: :member
  end
end
