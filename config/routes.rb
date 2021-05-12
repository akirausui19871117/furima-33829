Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'user_addresses', to: 'users/registrations#new_user_address'
    post 'user_addresses', to: 'users/registrations#create_user_address'
  end

  root to: "items#index"
  get 'items/search'
  resources :items  do
    resources :buys, only: [:index,:create]
    resources :messages, only: [:create]
  end
end