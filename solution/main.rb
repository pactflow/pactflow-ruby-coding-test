require 'pry'

Dir['./lib/**/*.rb'].each do |file|
  next unless file.include? 'lib'

  require_relative "#{file}"
end

p1 = Player.new('player_1')
p2 = Player.new('player_2')

g = Game.new(p1, p2)

g.point_won_by(p1)

puts g
