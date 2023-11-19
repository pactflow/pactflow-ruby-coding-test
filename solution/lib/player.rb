class Player
  attr_reader :name, :games_won

  def initialize(name)
    @name = name
    @games_won = 0
  end

  def won_game
    @games_won += 1
  end
end
