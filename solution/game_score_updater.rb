module GameScoreUpdater
  
  def update_game_score(player1_score, player2_score, game_score)
    if player1_score >= 4 && player1_score >= player2_score + 2
      game_score[0] += 1
      reset_scores(player1_score, player2_score)
    elsif player2_score >= 4 && player2_score >= player1_score + 2
      game_score[1] += 1
      reset_scores(player1_score, player2_score)
    elsif game_score.all? { |score| score.is_a?(Integer) } && game_score == [6, 6]
      play_tie_break(game_score)
    end
  end

  def reset_scores(player1_score, player2_score)
    player1_score = 0
    player2_score = 0
  end

  def play_tie_break(game_score)
    tie_break_score = [0, 0]

    loop do
      if rand(2) == 0
        tie_break_score[0] += 1
      else
        tie_break_score[1] += 1
      end

      break if (tie_break_score.max >= 7) && (tie_break_score.max >= tie_break_score.min + 2)
    end

    game_score.replace(["1-0", "0-1"][tie_break_score.index(tie_break_score.max)])
  end
end
