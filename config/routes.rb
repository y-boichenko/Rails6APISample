Rails.application.routes.draw do

  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end

  devise_for :users, skip: [:session, :password, :registration]

  namespace :v1 do
    resources :jobs, only: [:index, :show, :create, :update, :destroy]
    resources :users, only: [:create]
  end
end
