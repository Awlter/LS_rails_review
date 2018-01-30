Myflix::Application.routes.draw do
  root 'page#front'
  get '/home', to: 'categories#index'

  get '/register', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'

  resources :users, only: [:create]

  resources :videos, only: [:index, :show] do
    collection do
      get 'search'
    end
    resources :reviews, only: [:create]
  end

  resources :queue_items, only: [:index, :create, :destroy]

  get 'ui(/:action)', controller: 'ui'
end
