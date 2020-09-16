Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users
  resources :items
  get 'item/:id', to: 'item#tax'
end
