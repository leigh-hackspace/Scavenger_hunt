Rails.application.routes.draw do
	root "hunters#index"

	get "/ghosts", to: "ghosts#index"

	## ghostbusters show all available ghosts
	get "/ghosts/egon", to: "ghosts#all"
	get "/ghosts/peter", to: "ghosts#all"
	get "/ghosts/raymond", to: "ghosts#all"
	get "/ghosts/winston", to: "ghosts#all"

	get "/ghosts/:ghost_uuid", to: "ghosts#show"

	get "/hunters", to: "hunters#index"
end
