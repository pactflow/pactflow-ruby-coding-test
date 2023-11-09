# Run ruby main.rb and ruby tie_breaker.rb for running sample test cases,
# add similar test cases to test other scenarios
# Improvements: Can split the code into different classes, player, match, set if more time given.


require_relative 'tennis_score'

tennis_score = TennisScore.new
tennis_score.points_won_by('player1')
tennis_score.points_won_by('player2')
puts tennis_score.score # Should give 0-0 15-15

tennis_score.points_won_by('player1')
tennis_score.points_won_by('player1')
puts tennis_score.score # Should give 0-0 40-15

tennis_score.points_won_by('player2')
tennis_score.points_won_by('player2')
puts tennis_score.score # Should give 0-0, Deuce

tennis_score.points_won_by('player1')
puts tennis_score.score # Should give 0-0, Advantage player 1

tennis_score.points_won_by('player1')
puts tennis_score.score # Should give 1-0

24.times do
  tennis_score.points_won_by('player2')
  puts tennis_score.score
end # Should give (1-1, 0-15), (1-1, 0-30) to (1-6)

tennis_score.points_won_by('player2')
puts tennis_score.score # Should give player 2 won




