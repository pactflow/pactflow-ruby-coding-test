require_relative 'tennis_match'

# Input sequence to match the provided Java code
match = TennisMatch.new("player 1", "player 2")
# puts match.score # Output: "0-0"

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