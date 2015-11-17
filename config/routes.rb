Rails.application.routes.draw do
  root 'application#welcome'

  get 'home', controller: 'farms', action: 'index'
  get 'sign_up', controller: 'users', action: 'new'
  post 'sign_up', controller: 'users', action: 'create'
  post 'sign_in', controller: 'sessions', action: 'create'

  resources :farms, only: [:new, :create, :show]
  resources :users, only: [:show, :create]
  resources :reviews, only: [:index, :create]

  get 'ui(/:action)', controller: 'ui'
end

