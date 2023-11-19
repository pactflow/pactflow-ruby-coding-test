class Match
  attr_reader :set

  def initialize(player1, player2)
    @player_map = {
      player1 => Player.new(player1),
      player2 => Player.new(player2)
    }
    @set = MatchSet.new(@player_map[player1], @player_map[player2])
    @winner = nil
  end

  def point_won_by(player)
    @set.point_won_by(@player_map[player])
  end

  def score
    @set.score
  end

  def winner
    @set.winner
  end
end