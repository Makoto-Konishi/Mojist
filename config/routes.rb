Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'
  resources :users, except: [:new]

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    resources :users, except: [:new]
  end

end
