Myflix::Application.routes.draw do
  root 'page#front'
  get '/expired_token', to: 'page#expired_token'
  get '/home', to: 'categories#index'

  get '/register', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'
  

  resources :users, only: [:create, :show]
  resources :invitations, only: [:new, :create]
  get '/register/:token', to: "users#new_with_token", as: '/register_with_token'

  get '/people', to: 'relationships#index'
  resources :relationships, only: [:create, :destroy]

  resources :videos, only: [:index, :show] do
    collection do
      get 'search'
    end
    resources :reviews, only: [:create]
  end

  resources :queue_items, only: [:index, :create, :destroy]
  post '/update_queue', to: "queue_items#update"

  resources :forget_passwords, only: [:create]
  get '/forget_password', to: 'forget_passwords#new'

  resources :password_resets, only: [:show, :create]

  get 'ui(/:action)', controller: 'ui'
end
