# frozen_string_literal: true

Rails.application.routes.draw do
  root 'hunters#welcome'
  get 'hunters/all', to: 'hunters#all'

  resources :hunters, param: :hunter_uuid
  resources :items, param: :item_uuid

  # #sessions
  get 'login', to: 'sessions#login'
  get 'register', to: 'sessions#new', as: 'register'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  get '/items', to: 'items#index'

  get "/admin", to: "items#new"
  post "/admin", to: "items#create"

  ##easter eggs
  get '/bugs', to: 'items#all'
  get '/lola', to: 'items#all'
  get '/peter', to: 'items#all'
  get '/roger', to: 'items#all'
  get '/showall', to: 'items#all'  

  get '/wrong', to: 'items#wrong'

  get '/hunters', to: 'hunters#welcome'
  post '/hunt', to: 'hunters#capture'

  ## Scoreboard
  resources :scoreboard, only: :index

  get '/scoreboard', to: 'scoreboard#all', as: 'scoreboard'
end
