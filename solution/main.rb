require 'pry'

Dir['./lib/**/*.rb'].each do |file|
  next unless file.include? 'lib'

  require_relative "#{file}"
end

p = Player.new('player_1')
puts p.name
