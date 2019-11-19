Rails.application.routes.draw do
  root to: 'feeds#index'
  resources :feeds, only: [:index, :create]
  resources :articles, only: [:update]
end
