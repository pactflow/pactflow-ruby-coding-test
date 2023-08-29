class MatchSet
  def initialize(current_game)
    @current_game = current_game
    @game_score = { player_1: 0, player_2: 0 }
    @tie_break = nil
  end

  def score
    "#{@game_score[:player_1]}-#{@game_score[:player_2]}, #{@current_game.score(@tie_break)}"
  end

  def add_point(add_to_player_1)
    @current_game.add_point(add_to_player_1)
    # calculate the game win status after each point addition
    winning_margin = @tie_break.nil? ? 3 : 7
    add_game_score if player_1_score > winning_margin || player_2_score > winning_margin
  end

  def set_tie_breaker
    @tie_break = true
  end
    
  def player_1_game_score
    @game_score[:player_1]
  end

  def player_2_game_score
    @game_score[:player_2]
  end

  def inspect
    score()
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
