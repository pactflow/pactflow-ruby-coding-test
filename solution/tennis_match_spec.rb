# spec/tennis_match_spec.rb

require_relative 'tennis_match'

RSpec.describe TennisMatch do
  it "creates an instance of TennisMatch" do
    match = TennisMatch.new("player 1", "player 2")
    expect(match).to be_an_instance_of(TennisMatch)
  end
end
