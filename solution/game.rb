class Game
  attr_reader :winner, :points

  def initialize(match)
    @match = match
    @winner = nil
    initialize_points
  end

  def add_point_for(player)
    player = @match.find_player(player)
    puts "player is -> #{player.inspect}"
    @points[player] += 1
  end

  def game_points
    puts @points.inspect
    @points
  end

  private

  def initialize_points
    @points = [0, 0]
  end
end