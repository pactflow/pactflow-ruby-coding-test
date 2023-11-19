module GameType
  class DefaultGame < GameType::BaseGame
    SCORES = %w[0 15 30 40].freeze

    def score
      return if winner.is_a? Player

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

    private

    def deuce?
      max_score >= 3 && (@game_score[@player1] == @game_score[@player2])
    end

    def advantage?
      max_score >= 4 && (max_score - min_score == 1)
    end
  end
end