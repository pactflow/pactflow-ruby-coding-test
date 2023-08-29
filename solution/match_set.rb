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
    add_game_score if player_1_score > 3 || player_2_score > 3
  end

  private

  def add_game_score
    return unless (player_1_score - player_2_score).abs >= 2
    player_1_score > player_2_score ? (@game_score[:player_1] += 1) : (@game_score[:player_2] += 1)
    reset_current_game
  end

  def player_1_score
    @current_game.player_1_score
  end

  def player_2_score
    @current_game.player_2_score
  end

  def reset_current_game
    @current_game.reset
  end
end
