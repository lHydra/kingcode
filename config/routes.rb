Rails.application.routes.draw do
  resources :articles
  resources :contacts, only: [:new, :create]
  resources :projects

  root to: 'home#index'
end
