class GhostsController < ApplicationController
  def all
	  @ghosts = Ghost.all
    @ghosts = @ghosts.sort_by {|g| g.id}
  end

  def show
	  @ghost = Ghost.find_by_ghost_uuid(params[:ghost_uuid])
  end

  def new
	  @ghost = Ghost.new
  end

  def create
    @ghost = Ghost.new(ghost_params)
    @ghost.ghost_uuid = SecureRandom.uuid

    if @ghost.save
      redirect_to ghost_path(@ghost.ghost_uuid)
    else
      render :new
    end
  end


  def ghost_params
    params.require(:ghost).permit(:title, :body, :image)
  end
end
