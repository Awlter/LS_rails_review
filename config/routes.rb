Myflix::Application.routes.draw do
  root 'videos#index'
  get '/home', to: 'categories#index'

  resources :videos, only: [:index, :show]
  get 'ui(/:action)', controller: 'ui'
end
