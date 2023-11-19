class Game
  attr_reader :player1, :player2, :game_score

  SCORES = %w[0 15 30 40].freeze

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

    @game_score = {
      @player1 => 0,
      @player2 => 0
    }
  end

  def point_won_by(player)
    @game_score[player] += 1
  end

  def score
    if deuce?
      'Deuce'
    elsif advantage?
      "Advantage #{winning_player.name}"
    else
      "#{SCORES[@game_score[@player1]]}-#{SCORES[@game_score[@player2]]}"
    end
  end

  def winner
    if max_score >= 4 && (max_score - min_score >= 2)
      winning_player
    end
  end

  def max_score
    scores.max
  end

  def min_score
    scores.min
  end

  def scores
    [@game_score[@player1], @game_score[@player2]]
  end

  def winning_player
    max_score == @game_score[@player1] ? @player1 : @player2
  end

  def deuce?
    max_score >= 3 && (@game_score[@player1] == @game_score[@player2])
  end

  def advantage?
    max_score >= 4 && (max_score - min_score == 1)
  end
end
