require 'byebug'

class TennisMatch
  attr_reader :player1, :player2

  SCORE_MAPPING = { 0 => 0, 1 => 15, 2 => 30, 3 => 40, 4 => 0 }.freeze

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_score = 0
    @player2_score = 0
    @game_score = [0, 0]
  end

  def pointWonBy(player)
    if player == @player1
      @player1_score += 1
    elsif player == @player2
      @player2_score += 1
    else
      raise ArgumentError, "Invalid player"
    end

    update_game_score
  end

  def score
    game_score_display = "0-0"  # Initialize game score

    # Check if one player has won the game
    if @game_score[0] > 0 || @game_score[1] > 0
      return "#{@game_score[0]}-#{@game_score[1]}"
    end

    # Check if both players have a score of 40
    if @player1_score >= 3 && @player2_score >= 3 && @player1_score == @player2_score
      return "0-0, Deuce"
    end

    # Check if one player has the advantage
    if @player1_score >= 3 && @player2_score >= 3
      if @player1_score == @player2_score + 1
        return "0-0, Advantage #{@player1}"
      elsif @player2_score == @player1_score + 1
        return "0-0, Advantage #{@player2}"
      end
    end

    # Display individual point scores if not Deuce or Advantage
    if @player1_score > 0 || @player2_score > 0
      game_score_display = "0-0, #{SCORE_MAPPING[@player1_score]}-#{SCORE_MAPPING[@player2_score]}"
    end

    game_score_display
  end




  private

  def update_game_score
    if @player1_score >= 4 && @player1_score >= @player2_score + 2
      @game_score[0] += 1
      reset_scores
    elsif @player2_score >= 4 && @player2_score >= @player1_score + 2
      @game_score[1] += 1
      reset_scores
    elsif @game_score.all? { |score| score.is_a?(Integer) } && @game_score == [6, 6]
      play_tie_break
    end
  end

end
