class Game
    attr_reader :player1, :player2, :scoring_strategy, :winner

    def initialize(player1, player2, scoring_strategy)
        @player1 = player1
        @player2 = player2
        @scoring_strategy = scoring_strategy
    end

    def point_won_by(player)
    end

    def score
    end
end