Rails.application.routes.draw do
  devise_for :users
  get 'rooms/index'
  
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  resources :rooms do 
    resources :messages
  end
  
  resources :users
  
  root 'rooms#index'

end
