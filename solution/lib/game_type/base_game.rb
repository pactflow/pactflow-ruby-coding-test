module GameType

  class BaseGame
    attr_reader :player1, :player2, :game_score

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
      raise NotImplementedError, 'to be implemented by child class'
    end

    def winner
      raise NotImplementedError, 'to be implemented by child class'
    end

    def max_score
      all_scores.max
    end

    def min_score
      all_scores.min
    end

    def all_scores
      [@game_score[@player1], @game_score[@player2]]
    end

    def winning_player
      max_score == @game_score[@player1] ? @player1 : @player2
    end
  end
end