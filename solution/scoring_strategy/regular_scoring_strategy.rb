require_relative "./strategy/scoring_strategy.rb"

class RegularScoring 
    include ScoringStrategy
    TENNIS_POINTS = [0, 15, 30, 40].freeze

end
  