Rails.application.routes.draw do
  root 'application#welcome'

  get  'home',     controller: 'farms', action: 'index'
  get  'sign_up',  controller: 'users', action: 'new'
  post 'sign_up',  controller: 'users', action: 'create'
  get  'sign_in',  controller: 'sessions', action: 'new'
  post 'sign_in',  controller: 'sessions', action: 'create'
  get  'sign_out', controller: 'sessions', action: 'destroy'

  resources :farms, only: [:show, :new, :create] do
    post 'review', on: :member
  end

  resources :users, only: [:show, :create]
  resources :reviews, only: [:index]

  get 'ui(/:action)', controller: 'ui'
end

