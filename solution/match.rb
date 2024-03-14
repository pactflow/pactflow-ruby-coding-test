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

  def handle_regular_game(player)
    if player == @player1
      @player1_points += 1
    else
      @player2_points += 1
    end
    puts @player1_points, @player2_points
  end

  def handle_tiebreak(player)
    if player == @player1
      @player1_points += 1
    else
      @player2_points += 1
    end
  end
end

match = Match.new("player 1", "player 2")
match.point_won_by("player 1")
match.point_won_by("player 2")