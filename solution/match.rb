class Match
  attr_reader :player1, :player2

  TENNIS_SCORE = %w[0 15 30 40].freeze

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @total_score_player1 = 0
    @total_score_player2 = 0
    @current_score_player1 = 0
    @current_score_player2 = 0
  end

  def point_won_by(player)
    if player == player1
      @current_score_player1 += 1
    else
      @current_score_player2 += 1
    end

    check_game_result
  end

  def score
    "#{total_score}, #{current_score}"
  end

  private

  def check_game_result
    if @current_score_player1 > 4
      @total_score_player1 += 1
    elsif @current_score_player2 > 4
      @total_score_player2 += 1
    end
  end

  def current_score
    if @current_score_player1 >= 3 && @current_score_player2 >= 3
      handle_deuce_or_advantage
    else
      "#{TENNIS_SCORE[@current_score_player1]}-#{TENNIS_SCORE[@current_score_player2]}"
    end
  end

  def total_score
    "#{@total_score_player1}-#{@total_score_player2}"
  end

  def handle_deuce_or_advantage
    if @current_score_player1 == @current_score_player2
      "Deuce"
    elsif (@current_score_player1 - @current_score_player2).abs == 1
      "Advantage #{leading_player}"
    end
  end

  def leading_player
    @current_score_player1 > @current_score_player2 ? player1 : player2
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
match.point_won_by("player 1");
p match.score();