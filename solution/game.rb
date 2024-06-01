class Game
    attr_reader :player1, :player2, :scoring_strategy, :winner

    def initialize(player1, player2, scoring_strategy)
        @player1 = player1
        @player2 = player2
        @scoring_strategy = scoring_strategy
    end

    def point_won_by(player)
        @scoring_strategy.point_won_by(player)
        if winner = @scoring_strategy.winner(@player1, @player2)
          @winner = winner
          winner.win_game
          reset_scores
        end
    end

    def score
        @scoring_strategy.score(@player1, @player2)
    end

    def game_winner
        @winner
    end

    private

    def reset_scores
        @player1.reset_scores
        @player2.reset_scores
    end

end