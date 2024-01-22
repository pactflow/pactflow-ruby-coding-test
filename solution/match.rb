class Match
  attr_reader :player1, :player2
  TENNIS_SCORE = %w[0 15 30 40].freeze

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

  private

  def game_score
    if @game_score_player1 >= 3 && @game_score_player2 >= 3
      handle_deuce_or_advantage
    else
      "#{TENNIS_SCORE[@game_score_player1]}-#{TENNIS_SCORE[@game_score_player2]}"
    end
  end

  def handle_deuce_or_advantage
    if @game_score_player1 == @game_score_player2
      "Deuce"
    elsif (@game_score_player1 - @game_score_player2).abs == 1
      "Advantage #{leading_player}"
    end
  end

  def leading_player
    @game_score_player1 > @game_score_player2 ? player1 : player2
  end
end

match = Match.new("player 1", "player 2");
match.point_won_by("player 1");
match.point_won_by("player 2");

p match.score

match.point_won_by("player 1");
match.point_won_by("player 1");
p match.score();

match.point_won_by("player 2");
match.point_won_by("player 2");
p match.score();
match.point_won_by("player 1");
p match.score();