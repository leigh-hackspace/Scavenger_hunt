# frozen_string_literal: true

# :nodoc:
class ScoreboardController < ApplicationController
  def index
    @hunters = Hunter.all.sort_by { |h| -h.score }
  end

  def winner
    @hunters = Hunter.all.sort_by { |h| -h.score }
  end
end
