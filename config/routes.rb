Rails.application.routes.draw do
	root "hunters#welcome"
	get "hunters/all", to: "hunters#all"

	resources :hunters, param: :hunter_uuid
	resources :ghosts, param: :ghost_uuid

	get "/ghosts", to: "ghosts#index"
	get "/h4d3s", to: "ghosts#new"
	post "/h4d3s", to: "ghosts#create"

	## ghostbusters show all available ghosts
	get "/egon", to: "ghosts#all"
	get "/peter", to: "ghosts#all"
	get "/raymond", to: "ghosts#all"
	get "/winston", to: "ghosts#all"
	get "/pacman", to: "ghosts#all"

	#get "/ghosts/:ghost_uuid", to: "ghosts#show"
	get "/hunters", to: "hunters#welcome"
end
