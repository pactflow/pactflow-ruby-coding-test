class Player
    attr_accessor :name, :score, :games_won, :tie_break_score
  
    def initialize(name)
      @name = name
      reset_scores
      @games_won = 0
    end
  
    def reset_scores
      @score = 0
      @tie_break_score = 0
    end
  
    def win_point
      @score += 1
    end
  
    def win_game
      @games_won += 1
      reset_scores
    end
  
    def win_tie_break_point
      @tie_break_score += 1
    end
end