class Player
    attr_accessor :name, :score, :games_won
  
    def initialize(name)
      @name = name
      reset_scores
      @games_won = 0
    end
  
    def reset_scores
      @score = 0
    end
  
    def win_point
      @score += 1
    end
  
    def win_game
      @games_won += 1
      reset_scores
    end
  
end