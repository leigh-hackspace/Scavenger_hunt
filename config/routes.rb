Rails.application.routes.draw do
	root "hunters#welcome"


	get "/ghosts", to: "ghosts#index"
	get "/h4d3s", to: "ghosts#admin_page"

	## ghostbusters show all available ghosts
	get "/ghosts/egon", to: "ghosts#all"
	get "/ghosts/peter", to: "ghosts#all"
	get "/ghosts/raymond", to: "ghosts#all"
	get "/ghosts/winston", to: "ghosts#all"
	get "/ghosts/pacman", to: "ghosts#all"

	get "/ghosts/:ghost_uuid", to: "ghosts#show"

	get "/hunters", to: "hunters#welcome"

end
