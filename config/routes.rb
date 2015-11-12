Rails.application.routes.draw do
  root 'application#welcome'

  get 'ui(/:action)', to: 'ui'
end

