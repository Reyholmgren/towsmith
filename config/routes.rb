Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root "dashboard#index"
  resources :requests
  resources :providers

  post '/location', to: 'location#create'
end
