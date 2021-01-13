Rails.application.routes.draw do

  root "home#index"
  get 'home/index', to: 'home#index'

  get '/auth/github', as: "github_login"
  get '/auth/:provider/callback', to: "users#create_github"

  resources :tasks do
    get 'delete_task' => 'tasks#destroy', as: :delete_task
    post 'assign_task' => 'tasks#assign', as: :assign
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
