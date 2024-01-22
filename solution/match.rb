# frozen_string_literal: true
# Ruby version - 3.2.2
# tennis match game
class Match
  attr_reader :player1, :player2
  attr_accessor :current_score_player1, :current_score_player2, :total_score_player1, :total_score_player2

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
    player == player1 ? self.current_score_player1 += 1 : self.current_score_player2 += 1
    check_game_result
  end

  def score
    "#{total_score_player1}-#{total_score_player2}, #{current_score}"
  end

  private

  def check_game_result
    if current_score_player1 >= 4 && current_score_player1 >= @current_score_player2 + 2
      self.total_score_player1 += 1
      reset_current_scores
    elsif current_score_player2 >= 4 && current_score_player2 >= @current_score_player1 + 2
      self.total_score_player2 += 1
      reset_current_scores
    end
  end

  def current_score
    current_score_player1 >= 3 && current_score_player2 >= 3 ? handle_deuce_or_advantage : "#{TENNIS_SCORE[current_score_player1]}-#{TENNIS_SCORE[current_score_player2]}"
  end

  def handle_deuce_or_advantage
    return 'Deuce' if current_score_player1 == current_score_player2

    "Advantage #{leading_player}" if (current_score_player1 - current_score_player2).abs == 1
  end

  def leading_player
    current_score_player1 > current_score_player2 ? player1 : player2
  end

  def reset_current_scores
    self.current_score_player1 = self.current_score_player2 = 0
  end
end

match = Match.new('player 1', 'player 2')
match.point_won_by('player 1')
match.point_won_by('player 2')

p match.score

match.point_won_by('player 1')
match.point_won_by('player 1')
p match.score

match.point_won_by('player 2')
match.point_won_by('player 2')
p match.score
match.point_won_by('player 1')
p match.score
match.point_won_by('player 1')
p match.score

match.point_won_by('player 2')
p match.score
match.point_won_by('player 2')
p match.score
match.point_won_by('player 2')
p match.score
match.point_won_by('player 2')
p match.score
