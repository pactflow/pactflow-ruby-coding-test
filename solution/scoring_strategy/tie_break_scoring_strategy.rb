require_relative "./strategy/scoring_strategy.rb"

class TieBreakScoring 
    include ScoringStrategy

    def point_won_by(player)
      player.win_tie_break_point
    end
  
    def score(player1, player2)
      "#{player1.tie_break_score} - #{player2.tie_break_score}"
    end
  
    def winner(player1, player2)
      if player1.tie_break_score >= 7 && player1.tie_break_score >= player2.tie_break_score + 2
        player1
      elsif player2.tie_break_score >= 7 && player2.tie_break_score >= player1.tie_break_score + 2
        player2
      end
    end
end