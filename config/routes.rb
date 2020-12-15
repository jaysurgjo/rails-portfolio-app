Rails.application.routes.draw do

  root "home#index"
  get 'home/index', to: 'home#index'

  resources :tasks

  get 'signup/users', as: 'signup'
  resources :users

  resources :sessions, only: [:new, :create, :destroy]
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    post '/logout', to: 'sessions#destroy'
end
