Rails.application.routes.draw do

  root "home#index"

  resources :tasks
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

    get 'home/index'
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
    get 'signup/users', as: 'signup'
    get 'login/sessions', as: 'login'
    get 'logout/sessions', as: 'logout'
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
