class Game
  attr_reader :winner, :points

  POINT_MAPPING = [0, 15, 30, 40]

  def initialize(match)
    @match = match
    @winner = nil
    initialize_points
  end

  def add_point_for(player)
    player = @match.find_player(player)
    # puts "player is -> #{player.inspect}"
    @points[player] += 1

    check_if_match_is_won
  end

  def game_points
    return nil if !@winner.nil?

    #puts @points.inspect
    min_score = @points.min
    if min_score >= 3
      if @points[0] == @points[1]
        "Deuce"
      else
        player_index = @points.index(@points.max)
        player_name = @match.get_player_name(player_index)
        "Advantage #{player_name}"
      end 
    else
      @points.map { |p| POINT_MAPPING[p] }.join("-")
    end
  end

  private

  def check_if_match_is_won
    min_score = @points.min
    max_score = @points.max
    diff = max_score-min_score
    if max_score > 3 && diff > 1
      @winner = @points.index(max_score)
      # puts "#{@winner} won game"
      true
    else
      false
    end
  end

  def initialize_points
    @points = [0, 0]
  end
end