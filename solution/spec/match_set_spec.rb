describe 'match set' do

  let(:player_1) { Player.new('player_1') }
  let(:player_2) { Player.new('player_2') }
  let(:match_set) { MatchSet.new(player_1, player_2) }

  it 'checks for initial score' do
    expect(match_set.score).to eq('0-0, 0-0')
  end

  it 'checks for winning set for player 1' do
    2.times { match_set.point_won_by(player_1) }
    2.times { match_set.point_won_by(player_2) }
    2.times { match_set.point_won_by(player_1) }

    expect(match_set.score).to eq('1-0, 0-0')
  end

  it 'checks for winning set for player 2' do
    2.times { match_set.point_won_by(player_2) }
    match_set.point_won_by(player_1)
    expect(match_set.score).to eq('0-0, 15-30')
    2.times { match_set.point_won_by(player_2) }

    expect(match_set.score).to eq('0-1, 0-0')
  end
end
