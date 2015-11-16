Rails.application.routes.draw do
  root 'application#welcome'

  get 'home', controller: 'farms', action: 'index'
  get 'sign_up', controller: 'users', action: 'sign_up'
  get 'sign_in', controller: 'sessions', action: 'sign_in'

  resources :farms, only: [:new, :create, :show]
  resources :users, only: [:show, :create]
  resources :reviews, only: [:index, :create]

  get 'ui(/:action)', controller: 'ui'
end

