class Player
    attr_accessor :name, :score, :games_won, :tie_break_score
  
    def initialize(name)
      @name = name
      reset_scores
      @games_won = 0
    end
  
    # Reset scores to 0
    def reset_scores
      @score = 0
      @tie_break_score = 0
    end
  
    # Increment score by 1
    def win_point
      @score += 1
    end
  
    # Increment games won by 1 and reset scores
    def win_game
      @games_won += 1
      reset_scores
    end
  
    # Increment tie break score by 1
    def win_tie_break_point
      @tie_break_score += 1
    end
end