require_relative "./player.rb"
require_relative "./set.rb"

class Match
    # match has_one set 

    def initialize(player1_name, player2_name)
        @player1 = Player.new(player1_name)
        @player2 = Player.new(player2_name)
        @set = Set.new(@player1, @player2)
    end

    def point_won_by(player_name)
        player = player_name == @player1.name ? @player1 : @player2
        @set.point_won_by(player)
    end

    def current_set_score
        @set.score
    end

    def current_game_score
        @set.games.last.score
    end

    def score
        "#{current_set_score},  #{current_game_score}"
    end
end
