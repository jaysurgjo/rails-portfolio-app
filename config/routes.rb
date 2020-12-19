Rails.application.routes.draw do

  root "home#index"
  get 'home/index', to: 'home#index'

  resources :tasks do
    get 'delete_task' => 'tasks#destroy', as: :delete_task
  end

  resources :users do
    member do
      get :confirm_email
    end
  end

  get '/signup/users', to: 'users#new'
  resources :users, except: [:new]

  resources :sessions, only: [:new, :create, :destroy]
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'
    delete '/logout', to: 'sessions#destroy'
    post '/logout', to: 'sessions#destroy'
end
