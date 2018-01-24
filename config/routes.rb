Myflix::Application.routes.draw do
  root 'videos#index'
  get '/home', to: 'categories#index'

  get '/register', to: 'users#new'
  get '/sign_in', to: 'session#new'

  resources :users, only: [:create]

  resources :videos, only: [:index, :show] do
    collection do
      get 'search'
    end
  end

  get 'ui(/:action)', controller: 'ui'
end
