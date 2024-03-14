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
    if @player1_points >= 4 && (@player1_points - @player2_points) >= 2
      @player1_games += 1
    elsif @player2_points >= 4 && (@player2_points - @player1_points) >= 2
      @player2_games += 1
    elsif @player1_points >= 3 && @player2_points >= 3
      if @player1_points == @player2_points
        'Deuce'
      elsif (@player1_points - @player2_points).abs == 1
        "Advantage #{@player1_points > @player2_points ? @player1 : @player2}"
      else
        "#{score_mapping[@player1_points]}-#{score_mapping[@player2_points]}"
      end
    else
      puts "#{score_mapping[@player1_points]}-#{score_mapping[@player2_points]}"
    end
  end

  def check_tiebreak_result
  end
end

match = Match.new("player 1", "player 2")
match.point_won_by("player 1")
match.point_won_by("player 1")
match.point_won_by("player 1")
match.point_won_by("player 2")

#output will be 40-15