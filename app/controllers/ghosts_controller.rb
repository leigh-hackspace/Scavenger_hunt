class GhostsController < ApplicationController
  def all
	@ghosts = Ghost.all
  end

  def show
	@ghost = Ghost.find_by_ghost_uuid(params[:ghost_uuid])
  end

  def new
	@ghost = Ghost.new
  end

  def create
	@ghost = Ghost.new(title: "new ghost", body: "spooky")
	@ghost.ghost_uuid = SecureRandom.uuid

	if @ghost.save
	  redirect_to @ghost
        else
          render :new
        end
  end
end
