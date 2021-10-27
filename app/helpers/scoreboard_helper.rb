module ScoreboardHelper
    def score(hunter)
        hunter.ghosts.count * 10
    end
end
