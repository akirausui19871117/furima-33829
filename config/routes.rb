Rails.application.routes.draw do
  get 'buys/index'
  root to: "items#index"
  devise_for :users
  resources :items  do
    resources :buys, only: [:index,:create]
  end
end