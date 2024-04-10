# frozen_string_literal: true

require_relative 'match_scoring'
# Tennis match classs.
class TennisMatch
  include MatchScoring
  attr_reader :player1_name, :player2_name, :match_winner

  # Initialize the player names, default scores (match score as well as player scores).
  def initialize(player1_name, player2_name)
    # Raise an ArgumentError if player names are empty
    raise ArgumentError, 'Player names cannot be empty' if !present?(player1_name) || !present?(player2_name)

    @player1_name = player1_name
    @player2_name = player2_name
    @player1_score = 0
    @player2_score = 0
    @match_winner = nil
  end

  # Records a point won by a player and checks if the match is over.
  # If there is no match winner yet:
  #   - Increments the score of the respective player if the match is still ongoing.
  #   - After updating the scores, checks if there is a match winner.
  # If there is a match winner, no further points can be recorded.
  def point_won_by(player_name)
    raise ArgumentError, 'Invalid player name' if !present?(player1_name) || !present?(player2_name)

    # raise StandardError, "Match already over" unless @match_winner.nil?

    update_score(player_name)
    check_match_winner
  end

  private

  def present?(obj)
    !obj.nil? && !obj.empty?
  end

  # Check which player won the point and update their score accordingly
  def update_score(player_name)
    if player_name == @player1_name
      @player1_score += 1
    elsif player_name == @player2_name
      @player2_score += 1
    end
  end
end

# Check match status.
class Match < TennisMatch
  # MATCH_SCORE = { 0 => '0', 1 => '15', 2 => '30', 3 => '40' }.freeze

  private

  # Check if any player is a winner or if the match is in deuce or advantage.
  def check_match_winner
    if (@player1_score >= 4 && @player1_score >= @player2_score + 2) ||
       (@player2_score >= 4 && @player2_score >= @player1_score + 2)
      # Determine the match winner based on scores.
      @match_winner = @player1_score > @player2_score ? @player1_name : @player2_name
    elsif @player1_score >= 3 && @player2_score >= 3 && @player1_score == @player2_score
      # Handle deuce situation.
      @match_winner = 'Deuce'
    elsif @player1_score >= 3 && @player2_score >= 3 && (@player1_score - @player2_score).abs == 1
      # Handle advantage situation.
      @match_winner = "Advantage #{@player1_score > @player2_score ? @player1_name : @player2_name}"
    end
  end
end

# Example usage:

# Create a new match instance with players "Player A" and "Player B".
scorer = Match.new('Player A', 'Player B')
# Both players 'Player A' and 'Player B' won a point each.
scorer.point_won_by('Player A')
puts scorer.score # Output=> Set score: Player A-Player B, match score: 1-0
scorer.point_won_by('Player B')
puts scorer.score # Output=> Set score: Player A-Player B, match score: 1-1

# The Player A wins three consecutive points to win the game.
scorer.point_won_by('Player A')
scorer.point_won_by('Player A')
scorer.point_won_by('Player A')
puts scorer.score # Output=> Match over. Winner: Player A. Set score: Player A-Player B, match score: 4-1

# The Player B wins three consecutive points to tie the game.
scorer.point_won_by('Player B')
scorer.point_won_by('Player B')
scorer.point_won_by('Player B')
puts scorer.score # Output=> Match over. Winner: Deuce. Set score: Player A-Player B, match score: 4-4

# The Player A won another point, gaining advantage.
scorer.point_won_by('Player A')
puts scorer.score # Output=> Match over. Winner: Advantage Player A. Set score: Player A-Player B, match score: 5-4

# The Player A won another point, winning the game and match.
scorer.point_won_by('Player A')
puts scorer.score # Output=> Match over. Winner: Player A. Set score: Player A-Player B, match score: 6-4
