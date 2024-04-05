# spec/tennis_match_spec.rb
require 'byebug'
require_relative 'tennis_match'

RSpec.describe TennisMatch do
  it "creates an instance of TennisMatch" do
    match = TennisMatch.new("player 1", "player 2")
    expect(match).to be_an_instance_of(TennisMatch)
  end

  describe "#pointWonBy" do
    it "increments the score correctly for both players" do
      match = TennisMatch.new("player 1", "player 2")
      match.pointWonBy("player 1")
      match.pointWonBy("player 2")
      expect(match.score).to eq("0-0, 15-15")
    end
  end
end
