class Match
	def initialize(player1, player2)
		@player1 = player1
    @player2 = player2
    @player1_points = 0
    @player2_points = 0
    @player1_games = 0
    @player2_games = 0
    @is_tiebreak = false
	end
end

match = Match.new("player 1", "player 2")