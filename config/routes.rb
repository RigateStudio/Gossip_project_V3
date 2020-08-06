Rails.application.routes.draw do

  #INDEX
  root 'gossips#index'

  #STATIC
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'

  #FLEX
  get '/welcome/:first_name', to: 'flex#welcome'
  get '/userprofile/:id', to: 'flex#userprofile', as: 'author'

  resources :cities, only: [:show]
  resources :users, only: [:show, :create, :new]
  resources :gossips
  resources :sessions, only: [:new, :create, :destroy]

  resources :gossips do
    resources :comments, only: [:index, :create, :edit, :destroy, :update]
  end

  resources :gossips do
    resources :likes, only: [:destroy, :create]
  end

  
end    