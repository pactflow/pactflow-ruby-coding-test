require_relative 'tennis_match'

# Ruby test cases sequence that are similar to those used for testing Java interfaces.
match = TennisMatch.new("player 1", "player 2")
   puts "Ruby test cases sequence that are similar to those used for testing Java interfaces."
	puts match.score # Output: "0-0"

	match.pointWonBy("player 1")
	match.pointWonBy("player 2")
	puts match.score # Output: "0-0, 15-15"

	match.pointWonBy("player 1")
	match.pointWonBy("player 1")
	puts match.score # Output: "0-0, 40-15"

	match.pointWonBy("player 2")
	match.pointWonBy("player 2")
	puts match.score # Output: "0-0, Deuce"

	match.pointWonBy("player 1")
	puts match.score # Output: "0-0, Advantage player 1"

	match.pointWonBy("player 1")
	puts match.score # Output: "1-0"


# # One Player Wins the Game with No Deuce:
match = TennisMatch.new("player 1", "player 2")
	match.pointWonBy("player 1")
	match.pointWonBy("player 1")
	match.pointWonBy("player 1")
	match.pointWonBy("player 1")
  puts "One Player Wins the Game with No Deuce:"
	puts match.score



# One Player Wins the Game with Deuce:
match = TennisMatch.new("player 1", "player 2")
	match.pointWonBy("player 1")
	match.pointWonBy("player 1")
	match.pointWonBy("player 1")
	match.pointWonBy("player 2")
	match.pointWonBy("player 2")
	match.pointWonBy("player 1")
	match.pointWonBy("player 1")
	puts "One Player Wins the Game with Deuce:"
  puts match.score