class MatchSet
  attr_reader :current_game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_game = nil # initialize new game when point is scored
  end

  def point_won_by(player)
    start_new_game if @current_game.nil? # start a new game if last game was concluded

    @current_game.point_won_by(player)
    if player == @current_game.winner
      player.won_game
      @current_game = nil
    end
  end

  def score
    set_score = "#{games_won(@player1)}-#{games_won(@player2)}"
    if @current_game&.score
      "#{set_score}, #{@current_game.score}"
    else
      set_score
    end
  end

  def winner
    if [@player1.games_won, @player2.games_won].max >= 6 && (@player1.games_won - @player2.games_won).abs >= 2
      @player1.games_won > @player2.games_won ? @player1 : @player2
    end
  end

  private

  def games_won(player)
    player.games_won
  end

  def start_new_game
    game_klass = needs_tiebreak? ? GameType::TieBreakGame : GameType::DefaultGame
    @current_game = game_klass.new(@player1, @player2)
  end

  def needs_tiebreak?
    games_won(@player1) == 6 && games_won(@player2) == 6
  end
end