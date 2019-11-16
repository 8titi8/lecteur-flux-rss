Rails.application.routes.draw do
  root to: 'feed#index'
  resources :feeds, only: [:index, :create]
end
