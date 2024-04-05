# spec/tennis_match_spec.rb
require_relative 'tennis_match'

RSpec.describe TennisMatch do
  let(:match) { TennisMatch.new("player 1", "player 2") }

  describe "#score" do

    it "returns the score after player 1 scores once" do
      match.pointWonBy("player 1")
      expect(match.score).to eq("0-0, 15-0")
    end

    it "returns the score after both players score once" do
      match.pointWonBy("player 1")
      match.pointWonBy("player 2")
      expect(match.score).to eq("0-0, 15-15")
    end

    it "returns the score after player 1 scores twice" do
      match.pointWonBy("player 1")
      match.pointWonBy("player 1")
      expect(match.score).to eq("0-0, 30-0")
    end

    it "returns the score after player 1 scores thrice" do
      match.pointWonBy("player 1")
      match.pointWonBy("player 1")
      match.pointWonBy("player 1")
      expect(match.score).to eq("0-0, 40-0")
    end

    
  end
end
