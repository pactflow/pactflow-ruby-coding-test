#!/usr/bin/ruby
class Match
    attr_accessor :players
    @@game_score = {0 => 0, 1 => 15, 2 => 30, 3 => 40}

    def initialize(player_name_1, player_name_2)
        @players = {
            player_name_1 => {:set_score => 0, :game_score => 0},
            player_name_2 => {:set_score => 0, :game_score => 0}
        }
    end
    
    def score
        player_1 = @players[@players.keys[0]]
        player_2 = @players[@players.keys[1]]

        message = "#{@@game_score[player_1[:game_score]]}-#{@@game_score[player_2[:game_score]]}"
        unless (player_1[:game_score] < 3 or player_2[:game_score] < 3)
            case player_1[:game_score] - player_2[:game_score]
                when 0
                    message = "Deuce"
                when 1
                    message = "Advantage #{@players.keys[0]}"
                when -1
                    message = "Advantage #{@players.keys[1]}"
            end
        end

        puts "#{player_1[:set_score]}-#{player_2[:set_score]}, #{message}"
    end
    
    def pointWonBy(player_name)
        @players[player_name][:game_score] += 1
        
        player_1 = @players[@players.keys[0]]
        player_2 = @players[@players.keys[1]]
        
        unless (player_1[:game_score] < 3 or player_2[:game_score] < 3)
            case player_1[:game_score] - player_2[:game_score]
                when 2
                  player_1[:set_score] += 1
                  player_1[:game_score] = player_2[:game_score] = 0 
                when -2
                  player_2[:set_score] += 1
                  player_1[:game_score] = player_2[:game_score] = 0 
            end
        end
    end
end