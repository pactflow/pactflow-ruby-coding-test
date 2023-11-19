module GameType
  class TieBreakGame < GameType::BaseGame

    def score
      "TieBreak: #{all_scores.join('-')}"
    end

    def winner
      if max_score >= 7 && (max_score - min_score >= 2)
        winning_player
      end
    end

  end
end