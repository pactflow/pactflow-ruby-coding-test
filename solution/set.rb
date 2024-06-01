require_relative "./game.rb"
require_relative "./scoring_strategy/regular_scoring_strategy"
require_relative "./scoring_strategy/tie_break_scoring_strategy"

class Set
    attr_reader :games

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @games = []
        start_new_game
    end

    def point_won_by(player)
        current_game.point_won_by(player)
        
        check_set_winner
    end
    
    def score
        "#{@player1.games_won} - #{@player2.games_won}"
    end

    private

    def current_game
        @games.last
    end

    def start_new_game(tie_break: false)
        strategy = tie_break ? TieBreakScoring.new : RegularScoring.new
        @games << Game.new(@player1, @player2, strategy)
    end

    def check_set_winner
        if player = set_winner
          # Set is won
          # stop the code execution for now
          puts "#{player.name} WON THE SET"
          exit(false)
        elsif current_game_winner
            if @player1.games_won == 6 && @player2.games_won == 6
                start_new_game(tie_break: true) # Start tie-break game
            else
                start_new_game
            end
        end
    end

    def set_winner
        if @player1.games_won >= 6 && @player1.games_won >= @player2.games_won + 2
            @player1
          elsif @player2.games_won >= 6 && @player2.games_won >= @player1.games_won + 2
            @player2
          elsif @player1.games_won != @player2.games_won && (current_game.scoring_strategy.is_a? TieBreakScoring) 
            if @player1.games_won > @player2.games_won
                @player1
            else
                @player2
            end
        end
    end

    def current_game_winner
        current_game&.winner
    end
end