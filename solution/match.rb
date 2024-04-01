require "pry"

class Match
  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    @player1_points = @player2_points = 0
    @player1_games = @player2_games = 0
    @is_tiebreak = false
  end

  # Method to record a point won by a player
  def point_won_by(player)
    if @is_tiebreak
      handle_tiebreak(player)
    else
      handle_regular_game(player)
    end
  end

  # Method to get the current score of the match
  def score
    if @is_tiebreak
      "#{@player1_games}-#{@player2_games}, #{tiebreak_score}"
    else
      "#{@player1_games}-#{@player2_games}, #{game_score}"
    end
  end

  private

  # Mapping of points to their corresponding scores
  def score_mapping
    { 0 => '0', 1 => '15', 2 => '30', 3 => '40' }
  end

  # Method to handle a regular game situation
  def handle_regular_game(player)
    if player == @player1
      @player1_points += 1
    else
      @player2_points += 1
    end

    check_game_result
  end

  # Method to handle a tiebreak situation
  def handle_tiebreak(player)
    if player == @player1
      @player1_points += 1
    else
      @player2_points += 1
    end

    check_tiebreak_result
  end

  # Method to check the result of a regular game
  def check_game_result
    if player1_wins_game?
      update_player1_games
      reset_points
    elsif player2_wins_game?
      update_player2_games
      reset_points
    elsif deuce?
      'Deuce'
    elsif advantage?
      "Advantage #{advantaged_player}"
    else
      "#{score_mapping[@player1_points]}-#{score_mapping[@player2_points]}"
    end
  end

  # Method to check if player 1 has won the game
  def player1_wins_game?
    @player1_points >= 4 && (@player1_points - @player2_points) >= 2
  end

  # Method to check if player 2 has won the game
  def player2_wins_game?
    @player2_points >= 4 && (@player2_points - @player1_points) >= 2
  end

  # Method to check if the game is in a deuce situation
  def deuce?
    @player1_points >= 3 && @player2_points >= 3 && @player1_points == @player2_points
  end

  # Method to check if there's an advantage situation
  def advantage?
    @player1_points >= 3 && @player2_points >= 3 && ((@player1_points - @player2_points).abs == 1)
  end

  # Method to determine the player who has the advantage
  def advantaged_player
    @player1_points > @player2_points ? @player1 : @player2
  end

  # Method to update player 1's game count
  def update_player1_games
    @player1_games += 1
  end

  # Method to update player 2's game count
  def update_player2_games
    @player2_games += 1
  end

  # Method to check the result of a tiebreak
  def check_tiebreak_result
    if tiebreak_over?
      update_games_and_reset_points
      @is_tiebreak = false
    end
  end

  # Method to check if the tiebreak is over
  def tiebreak_over?
    (@player1_points >= 7 || @player2_points >= 7) && (@player1_points - @player2_points).abs >= 2
  end

  # Method to update game counts and reset points after a tiebreak
  def update_games_and_reset_points
    if @player1_points > @player2_points
      @player1_games += 1
    else
      @player2_games += 1
    end
    reset_points
  end

  # Method to reset points after each game or tiebreak
  def reset_points
    @player1_points = 0
    @player2_points = 0
  end

  # Method to calculate and return game score
  def game_score
    if @player1_points >= 3 && @player2_points >= 3
      return 'Deuce' if @player1_points == @player2_points
      return "Advantage #{advantaged_player}" if advantage?

      "#{score_mapping[@player1_points]}-#{score_mapping[@player2_points]}"
    else
      "#{score_mapping[@player1_points]}-#{score_mapping[@player2_points]}"
    end
  end

  # Method to check if there's an advantage situation
  def advantage?
    (@player1_points - @player2_points).abs == 1
  end

  # Method to determine the player who has the advantage
  def advantaged_player
    @player1_points > @player2_points ? @player1 : @player2
  end

  # Method to return the tiebreak score
  def tiebreak_score
    "#{@player1_points}-#{@player2_points}"
  end

end

match = Match.new("player 1", "player 2")
match.point_won_by("player 1")
match.point_won_by("player 2")

match.point_won_by("player 1")
match.point_won_by("player 1")

match.point_won_by("player 2")
match.point_won_by("player 2")
match.point_won_by("player 1")
match.point_won_by("player 1")

puts match.score # "1-0, 0-0"