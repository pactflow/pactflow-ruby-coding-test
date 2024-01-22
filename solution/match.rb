class Match
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @game_score_player1 = 0
    @game_score_player2 = 0
  end

  def point_won_by(player)
    if player == player1
      @game_score_player1 += 1
    else
      @game_score_player2 += 1
    end
  end

  def score
    game_score
  end

  def game_score
    ["0", "15", "30", "40"][@game_score_player1] + "-#{["0", "15", "30", "40"][@game_score_player2]}"
  end
end

match = Match.new("player 1", "player 2");
match.point_won_by("player 1");
match.point_won_by("player 2");
match.point_won_by("player 2");
p match.score
