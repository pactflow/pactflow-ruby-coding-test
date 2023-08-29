# Interface for the user to interact and modify the Match status
require_relative 'match_set.rb'
require_relative 'game.rb'

class Match
  attr_reader :player_1, :player_2

  def initialize(player_1_name = 'player 1', player_2_name = 'player 2')
    @player_1= player_1_name
    @player_2= player_2_name
    @set = MatchSet.new(Game.new(player_1_name, player_2_name))
    @match_result = nil
    @tie_break = false
  end

  def score
    puts "=======================\n\n\n#{@match_result}" unless @match_result.nil?
    @set.score
  end

  def point_won_by(player_name)
    return score unless @match_result.nil?
    (player_1 == player_name) ? @set.add_point(true) : @set.add_point(false)
    match_completed? if player_1_game_score >= 6 || player_2_game_score >= 6
  end

  def inspect
    puts "#{player_1} vs #{player_2}"
    score()
  end

  private

  def match_completed?
    if @tie_break && player_1_game_score != player_2_game_score
      @match_result = (player_1_game_score > player_2_game_score) ? "Match won by #{player_1} in a tie-break" : "Match won by #{player_2} in a tie-break"
    elsif((player_1_game_score - player_2_game_score).abs >= 2)
      @match_result = (player_1_game_score > player_2_game_score) ? "Match won by #{player_1}" : "Match won by #{player_2}"
    elsif (player_1_game_score == player_2_game_score)
      @tie_break = true
      @set.set_tie_breaker
    end
  end

  def player_1_game_score
    @set.player_1_game_score
  end

  def player_2_game_score
    @set.player_2_game_score
  end
end
