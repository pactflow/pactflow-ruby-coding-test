require_relative 'game'

class Match
  attr_accessor :players

  def initialize(player1, player2)
    initialize_players(player1, player2)
    initialize_games
  end

  def pointWonBy(player)
    current_game = find_current_game
    current_game.add_point_for(player)
  end

  def score
    game_score = [0, 0]
    @games.each do |g|
      next if g.winner.nil?

      game_score[g.winner] += 1
    end

    current_game = find_current_game

    return [
      game_score.join("-"), 
      current_game.game_points.join("-")
    ].join(", ")
  end

  def find_player(player)
    @players[player]
  end

  private

  def initialize_players(player1, player2)
    @players = {}

    @players[player1] = 0
    @players[player2] = 1 
  end

  def initialize_games
    @games = []
  end

  def find_current_game
    @current_game = @games.select { |g| g.winner.nil? }.first
 
    if @current_game.nil?
      @games << Game.new(self)
      @current_game = @games.select { |g| g.winner.nil? }.first
    end

    @current_game
  end
end
