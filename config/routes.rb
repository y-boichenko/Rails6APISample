Rails.application.routes.draw do
  namespace :v1 do
    resources :jobs, only: [:index, :show, :create]
  end
end
