require_relative 'game'

class Match
  attr_accessor :players

  def initialize(player1, player2)
    initialize_players(player1, player2)
    initialize_games
  end

  def pointWonBy(player)
    current_game = find_current_game
    game_won = current_game.add_point_for(player)
    if game_won
      update_game_score(current_game.winner)
      @current_game = nil
    end
  end

  def score
    if @current_game.nil?
      @game_score.join("-")
    else
      [
        @game_score.join("-"), 
        @current_game.game_points
      ].join(", ")
    end
  end

  def find_player(player)
    @players[player]
  end

  def get_player_name(index)
    @players.key(index)
  end

  private

  def update_game_score(winner)
    @game_score[winner] += 1
  end

  def initialize_players(player1, player2)
    @players = {}

    @players[player1] = 0
    @players[player2] = 1 
  end

  def initialize_games
    @games = []
    @game_score = [0,0]
  end

  def find_current_game
    #puts "games is #{@games.inspect}\n"
    @current_game ||= @games.select { |g| g.winner.nil? }.first
 
    if @current_game.nil?
      @games << Game.new(self)
      @current_game ||= @games.select { |g| g.winner.nil? }.first
    end

    @current_game
  end
end
