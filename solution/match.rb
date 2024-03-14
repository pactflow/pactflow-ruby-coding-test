require "pry"

class Match
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_points = 0
    @player2_points = 0
    @player1_games = 0
    @player2_games = 0
    @is_tiebreak = false
  end

  def point_won_by(player)
    if @is_tiebreak
      handle_tiebreak(player)
    else
      handle_regular_game(player)
    end
  end

  def score
    if @is_tiebreak
      "#{@player1_games}-#{@player2_games}, #{tiebreak_score}"
    else
      "#{@player1_games}-#{@player2_games}, #{game_score}"
    end
  end

  private

  def score_mapping
    { 0 => '0', 1 => '15', 2 => '30', 3 => '40' }
  end

  def handle_regular_game(player)
    if player == @player1
      @player1_points += 1
    else
      @player2_points += 1
    end

    check_game_result
  end

  def handle_tiebreak(player)
    if player == @player1
      @player1_points += 1
    else
      @player2_points += 1
    end

    check_tiebreak_result
  end

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

  def player1_wins_game?
    @player1_points >= 4 && (@player1_points - @player2_points) >= 2
  end

  def player2_wins_game?
    @player2_points >= 4 && (@player2_points - @player1_points) >= 2
  end

  def deuce?
    @player1_points >= 3 && @player2_points >= 3 && @player1_points == @player2_points
  end

  def advantage?
    @player1_points >= 3 && @player2_points >= 3 && ((@player1_points - @player2_points).abs == 1)
  end

  def advantaged_player
    @player1_points > @player2_points ? @player1 : @player2
  end

  def update_player1_games
    @player1_games += 1
  end

  def update_player2_games
    @player2_games += 1
  end

  def check_tiebreak_result
    if tiebreak_over?
      update_games_and_reset_points
      @is_tiebreak = false
    end
  end

  def tiebreak_over?
    (@player1_points >= 7 || @player2_points >= 7) && (@player1_points - @player2_points).abs >= 2
  end

  def update_games_and_reset_points
    if @player1_points > @player2_points
      @player1_games += 1
    else
      @player2_games += 1
    end
    reset_points
  end

  def reset_points
    @player1_points = 0
    @player2_points = 0
  end

  def game_score
    if @player1_points >= 3 && @player2_points >= 3
      return 'Deuce' if @player1_points == @player2_points
      return "Advantage #{advantaged_player}" if advantage?

      "#{score_mapping[@player1_points]}-#{score_mapping[@player2_points]}"
    else
      "#{score_mapping[@player1_points]}-#{score_mapping[@player2_points]}"
    end
  end

  def advantage?
    (@player1_points - @player2_points).abs == 1
  end

  def advantaged_player
    @player1_points > @player2_points ? @player1 : @player2
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