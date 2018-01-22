Myflix::Application.routes.draw do
  root 'videos#index'
  get '/home', to: 'categories#index'

  resources :videos, only: [:index, :show] do
    collection do
      get 'search'
    end
  end

  get 'ui(/:action)', controller: 'ui'
end
