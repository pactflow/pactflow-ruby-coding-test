describe 'match' do
  let(:player_1) { Player.new('player_1') }
  let(:player_2) { Player.new('player_2') }
  let(:match) { Match.new(player_1, player_2) }

  it '#point_won_by should call match set' do
    expect(match.set).to receive(:point_won_by).and_call_original

    match.point_won_by(player_1)
  end

  it '#score should call match set' do
    expect(match.set).to receive(:score).and_call_original

    match.score
  end

  it '#winner should call match set' do
    expect(match.set).to receive(:winner).and_call_original

    match.winner
  end
end