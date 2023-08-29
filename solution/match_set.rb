require_relative 'game.rb'
class MatchSet
  def initialize(player_1_name, player_2_name)
    @current_game = Game.new(player_1_name, player_2_name)
    @game_score = { player_1: 0, player_2: 0 }
  end

  def score
    "#{@game_score[:player_1]}-#{@game_score[:player_2]}, #{@current_game.score}"
  end

  def add_point(add_to_player_1)
    @current_game.add_point(add_to_player_1)
    # calculate the game win status after each point addition
  end
end
