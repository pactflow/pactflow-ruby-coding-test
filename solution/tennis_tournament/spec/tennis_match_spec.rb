require_relative 'tennis_match'

RSpec.describe TennisMatch do
  describe "#score" do
    context "when the match is ongoing" do
      it "returns the current set score and match score" do
        scorer = TennisMatch.new("Player A", "Player B")
        scorer.point_won_by("Player A")
        expect(scorer.score).to eq("Set score: Player A-Player B, match score: 15-0")
      end
    end

    context "when the match is over" do
      it "returns the winner of the match" do
        scorer = TennisMatch.new("Player A", "Player B")
        4.times { scorer.point_won_by("Player A") }
        expect(scorer.score).to eq("match over. Winner: Player A")
      end
    end
  end

  describe "#point_won_by" do
    it "increments the score of the player who won the point" do
      scorer = TennisMatch.new("Player A", "Player B")
      scorer.point_won_by("Player A")
      expect(scorer.score).to eq("Set score: Player A-Player B, match score: 15-0")
    end

    it "doesn't change the score if the match is over" do
      scorer = TennisMatch.new("Player A", "Player B")
      4.times { scorer.point_won_by("Player A") }
      scorer.point_won_by("Player B")
      expect(scorer.score).to eq("match over. Winner: Player A")
    end
  end
end
