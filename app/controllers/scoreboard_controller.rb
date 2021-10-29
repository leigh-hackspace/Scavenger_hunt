class ScoreboardController < ApplicationController

  def index
   @hunters = Hunter.all
   @hunters = @hunters.sort_by {|h| -h.score}
  end

end
