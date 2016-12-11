Rails.application.routes.draw do
  resources :articles
  resources :contacts, only: [:new, :create]
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
