Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :sessions, only: %i[new create destroy]
  resources :articles
  resources :contacts, only: %i[new create]
  resources :projects

  root to: 'home#index'
end
