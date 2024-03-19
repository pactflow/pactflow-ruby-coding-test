require_relative '../match'

RSpec.describe Match do
  let(:match) { Match.new("player 1", "player 2") }

  it "returns correct score after points won" do
    match.pointWonBy("player 1")
    match.pointWonBy("player 2")
    expect(match.score).to eq("0-0, 15-15")

    match.pointWonBy("player 1")
    match.pointWonBy("player 1")
    expect(match.score).to eq("0-0, 40-15")

    match.pointWonBy("player 2")
    match.pointWonBy("player 2")
    expect(match.score).to eq("0-0, Deuce")

    match.pointWonBy("player 1")
    expect(match.score).to eq("0-0, Advantage player 1")

    match.pointWonBy("player 1")
    expect(match.score).to eq("1-0")
  end
end
