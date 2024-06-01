require_relative "./strategy/scoring_strategy.rb"

class RegularScoring 
    include ScoringStrategy
    TENNIS_POINTS = [0, 15, 30, 40].freeze
    
    def point_won_by(player)
        player.win_point
    end
    
    def score(player1, player2)
        if deuce?(player1, player2)
            "Deuce"
        elsif advantage?(player1, player2)
            "Advantage #{leading_player(player1, player2).name}"
        else
            "#{score_to_display(player1)} - #{score_to_display(player2)}"
        end
    end
    
    def winner(player1, player2)
        if player1.score >= 4 && player1.score >= player2.score + 2
            player1
        elsif player2.score >= 4 && player2.score >= player1.score + 2
            player2
        end
    end
    
    private
    
    def score_to_display(player)
        TENNIS_POINTS[player.score] || "Game"
    end

    def deuce?(player1, player2)
        player1.score >= 3 && player2.score >= 3 && player1.score == player2.score
    end

    def advantage?(player1, player2)
        (player1.score >= 3 && player2.score >= 3) && (player1.score - player2.score).abs == 1
    end

    def leading_player(player1, player2)
        player1.score > player2.score ? player1 : player2
    end
end
  