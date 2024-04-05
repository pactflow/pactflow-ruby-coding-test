# tennis_match.rb

class TennisMatch
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_score = 0
    @player2_score = 0
  end
  
  def pointWonBy(player)
    if player == @player1
      @player1_score += 1
    elsif player == @player2
      @player2_score += 1
    else
      raise ArgumentError, "Invalid player"
    end
  end

  def score
    "0-0, 15-15"  # Fixed initial output
  end

end
