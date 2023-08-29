# Interface for the user to interact and modify the Match status
require_relative 'match_set.rb'

class Match
  attr_reader :player_1, :player_2

  def initialize(player_1_name = 'player 1', player_2_name = 'player 2')
    @player_1= player_1_name
    @player_2= player_2_name
    @set = MatchSet.new(player_1_name, player_2_name)
  end

  def score
    @set.score
  end

  def point_won_by(player_name)
    if(player_1 == player_name)
      @set.add_point(true)
    else
      @set.add_point(false)
    end
  end
end
