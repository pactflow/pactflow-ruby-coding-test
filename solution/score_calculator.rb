module ScoreCalculator
  include ScoreMapping

  def calculate_score(player1_score, player2_score)
    if game_over?(@game_score)
      "#{@game_score[0]}-#{@game_score[1]}"
    elsif deuce?(@player1_score, @player2_score)
      "0-0, Deuce"
    elsif advantage?(@player1_score, @player2_score)
      "0-0, Advantage #{leading_player}"
    else
      "#{game_score_display}, #{SCORE_MAPPING[@player1_score]}-#{SCORE_MAPPING[@player2_score]}"
    end
  end

  private

  def game_over?(game_score)
    game_score[0] > 0 || game_score[1] > 0
  end

  def deuce?(player1_score, player2_score)
    player1_score >= 3 && player2_score >= 3 && player1_score == player2_score
  end

  def advantage?(player1_score, player2_score)
    player1_score >= 3 && player2_score >= 3 && (player1_score - player2_score).abs == 1
  end

  def leading_player
    @player1_score > @player2_score ? @player1 : @player2
  end

  def game_score_display
    "0-0"
  end
end
