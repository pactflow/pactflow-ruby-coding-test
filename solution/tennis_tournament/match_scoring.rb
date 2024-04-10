# frozen_string_literal: true

# Module for handling match scoring logic
# Returns current score of the match with players scores
# If there is no match winner yet:
#   - Concatenates player scores to display the current match score.
# If there is a match winner:
#   - Indicates that the match is over and displays the winner.
module MatchScoring
  def score
    match_score = "#{@player1_score}-#{@player2_score}"
    if @match_winner.nil?
      "Set score: #{@player1_name}-#{@player2_name}, match score: #{match_score}"
    else
      "Match over. Winner: #{@match_winner}. Set score: #{@player1_name}-#{@player2_name}, match score: #{match_score}"
    end
  end
end
