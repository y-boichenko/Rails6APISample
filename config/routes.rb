Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'authenticate', to: 'authentication#authenticate'
  resources :jobs, only: [:show, :create]
end
