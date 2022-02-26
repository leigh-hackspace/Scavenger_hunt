# frozen_string_literal: true

# :nodoc:
class ScoreboardController < ApplicationController
  def index
    @hunters = Hunter.all
    @hunters = @hunters.sort_by { |h| -h.score }
  end
end
