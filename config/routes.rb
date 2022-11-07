Rails.application.routes.draw do
#  devise_for :users
  get 'rooms/index'
  
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signup', to: 'registrations#new'
  post '/signup', to: 'registrations#create'
  delete '/logout', to: 'sessions#destroy'
  get '/home', to: 'pages#home'

  resources :rooms do 
    resources :messages
  end
  
  resources :users
  
  root 'rooms#index'

end
