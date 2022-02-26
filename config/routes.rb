# frozen_string_literal: true

Rails.application.routes.draw do
  root 'hunters#welcome'
  get 'hunters/all', to: 'hunters#all'

  resources :hunters, param: :hunter_uuid
  resources :ghosts, param: :ghost_uuid

  # #sessions
  get 'login', to: 'sessions#login'
  get 'register', to: 'sessions#new', as: 'register'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  get '/items', to: 'items#index'

  #	get "/h4d3s", to: "ghosts#new"
  #	post "/h4d3s", to: "ghosts#create"

  ## ghostbusters show all available ghosts
  get '/egon', to: 'items#all'
  get '/peter', to: 'items#all'
  get '/raymond', to: 'items#all'
  get '/winston', to: 'items#all'
  get '/pacman', to: 'items#all'
  get '/wrong', to: 'items#wrong'

  get '/hunters', to: 'hunters#welcome'
  post '/hunt', to: 'hunters#capture'

  ## Scoreboard
  resources :scoreboard, only: :index

  get '/scoreboard', to: 'scoreboard#all', as: 'scoreboard'
end
