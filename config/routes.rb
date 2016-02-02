Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root "dashboard#index"
  resources :requests
  resources :providers
  resources :quote_tables

  post '/location', to: 'location#create'

  # GET
  get '/about', to: 'static#about'
end
