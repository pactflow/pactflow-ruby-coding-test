require_relative "./game.rb"
require_relative "./scoring_strategy/regular_scoring_strategy"

class Set
    attr_reader :games

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @games = []
        start_new_game
    end

    def start_new_game
        @games << Game.new(@player1, @player2, RegularScoring.new)
    end

    def point_won_by(player) 
    end
    
    def score
    end
end