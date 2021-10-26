class ScoreboardController < ApplicationController

  def index
   @hunters = Hunter.all
  end

end