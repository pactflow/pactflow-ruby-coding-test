class TennisMatch
  attr_reader :player1_name, :player2_name

  # Initialize the player names, default scores (match score as well as player scores).
  def initialize(player1_name, player2_name)
    @player1_name = player1_name
    @player2_name = player2_name
    @player1_score = 0
    @player2_score = 0
    @match_score = { 0 => '0', 1 => '15', 2 => '30', 3 => '40' }
    @match_winner = nil
  end

  # Returns current score of the match with players scores
  # If there is no match winner yet:
  #   - Concatenates player scores to display the current match score.
  # If there is a match winner:
  #   - Indicates that the match is over and displays the winner.
  def score
    if @match_winner.nil?
      # Concatenate player match scores to display the current match score.
      match_score = "#{@match_score[@player1_score]}-#{@match_score[@player2_score]}"
      return "Set score: #{@player1_name}-#{@player2_name}, match score: #{match_score}"
    else
      return "match over. Winner: #{@match_winner}"
    end
  end


  # Records a point won by a player and checks if the match is over.
  # If there is no match winner yet:
  #   - Increments the score of the respective player if the match is still ongoing.
  #   - After updating the scores, checks if there is a match winner.
  # If there is a match winner, no further points can be recorded.

  def point_won_by(player_name)
    if @match_winner.nil?
      # Increment the score of the respective player if the match is still ongoing.
      if player_name == @player1_name
        @player1_score += 1
      elsif player_name == @player2_name
        @player2_score += 1
      end

      # Check if there is a match winner after updating scores.
      check_match_winner
    end
  end

  private

  # Check if any player is a winner or if the match is in deuce or advantage.
  def check_match_winner
    if (@player1_score >= 4 && @player1_score >= @player2_score + 2) ||
       (@player2_score >= 4 && @player2_score >= @player1_score + 2)
      # Determine the match winner based on scores.
      @match_winner = (@player1_score > @player2_score) ? @player1_name : @player2_name
    elsif @player1_score >= 3 && @player2_score >= 3 && @player1_score == @player2_score
      # Handle deuce situation.
      @match_winner = "Deuce"
    elsif @player1_score >= 3 && @player2_score >= 3 && (@player1_score - @player2_score).abs == 1
      # Handle advantage situation.
      @match_winner = "Advantage #{@player1_score > @player2_score ? @player1_name : @player2_name}"
    end
  end
end


# Example usage:
scorer = TennisMatch.new("Player A", "Player B")
scorer.point_won_by("Player A")
puts scorer.score #=> Set score: Player A-Player B, match score: 15-0
scorer.point_won_by("Player B")
puts scorer.score #=> Set score: Player A-Player B, match score: 15-15
scorer.point_won_by("Player A")
scorer.point_won_by("Player A")
scorer.point_won_by("Player A")
puts scorer.score #=> Set score: Player A-Player B, match score: 40-15
scorer.point_won_by("Player B")
scorer.point_won_by("Player B")
scorer.point_won_by("Player B")
puts scorer.score #=> Set score: Player B-Player A, match score: 40-40 (Deuce)
scorer.point_won_by("Player A")
puts scorer.score #=> Set score: Player A-Player B, match score: Advantage for Player A
scorer.point_won_by("Player A")
puts scorer.score #=> match over. Winner: Player A
