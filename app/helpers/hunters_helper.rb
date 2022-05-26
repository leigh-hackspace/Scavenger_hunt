# frozen_string_literal: true

# :nodoc:
module HuntersHelper
  def score(hunter)
    hunter.items.counted.count * 10
  end

  def high_score(hunters)
    top_score = score(hunters.first)
  end

  def pick_random_winner(hunters)
    winners = Hash.new
    i = 0
    high_score = high_score(hunters)
    hunters.each do |hunt|
      if hunt.score == high_score
        winners.store(i, hunt.hunter_name)
        i = i+1
      end
    end
    max = winners.length - 1
    random_num = rand(0..max)
    winners.fetch(random_num)
  end

  def generate_session_id(hunter)
    Digest::MD5.hexdigest "#{hunter.hunter_uuid}+ #{hunter.hunter_name}"
  end
end
