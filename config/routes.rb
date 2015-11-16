Rails.application.routes.draw do
  root 'application#welcome'

  get 'ui(/:action)', controller: 'ui'
end

