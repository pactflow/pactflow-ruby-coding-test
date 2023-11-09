require_relative 'tennis_score'

tennis_score = TennisScore.new
# player 2 should win 5 times

20.times do
  tennis_score.points_won_by('player2')
  puts tennis_score.score
end

# player 1 should win 6 times

24.times do
  tennis_score.points_won_by('player1')
  puts tennis_score.score
end


tennis_score.points_won_by('player2')
tennis_score.points_won_by('player2')
tennis_score.points_won_by('player2')
tennis_score.points_won_by('player2')

puts tennis_score.score

7.times do
  tennis_score.points_won_by('player2')
  # should increment score by 1 till player 2 wins
  puts tennis_score.score
end
