# Interface for the user to interact and modify the Match status
require_relative 'match_set.rb'

class Match
  attr_reader :player_1, :player_2

  def initialize(player_1_name = 'player 1', player_2_name = 'player 2')
    @player_1= player_1_name
    @player_2= player_2_name
    @set = MatchSet.new(player_1_name, player_2_name)
    @match_completed = nil
  end

  def score
    @set.score
  end

  def point_won_by(player_name)
    (player_1 == player_name) ? @set.add_point(true) : @set.add_point(false)
    match_completed? if player_1_game_score >= 6 || player_2_game_score >= 6
  end

  private

  def match_completed?
    # to calculate game score and act accordingly
    # need to handle tie-break also
  end

  def player_1_game_score
    @set.game_score[:player_1]
  end

  def player_2_game_score
    @set.game_score[:player_2]
  end
end
