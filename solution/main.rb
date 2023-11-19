require 'pry'

Dir['./lib/**/*.rb'].each do |file|
  next unless file.include? 'lib'

  require_relative "#{file}"
end

# example from readme.md
match = Match.new('player 1', 'player 2')
match.point_won_by('player 1')
match.point_won_by('player 2')
puts "expected: 0-0, 15-15 / got: #{match.score}"

match.point_won_by('player 1')
match.point_won_by('player 1')
puts "expected: 0-0, 40-15 / got: #{match.score}"

match.point_won_by('player 2')
match.point_won_by('player 2')
puts "expected: 0-0, Deuce / got: #{match.score}"

match.point_won_by('player 1')
puts "expected: 0-0, Advantage player 1 / got: #{match.score}"

match.point_won_by('player 1')
puts "expected: 1-0 / got: #{match.score}"