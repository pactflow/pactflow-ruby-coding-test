describe 'player object initialize' do
  let(:player) { Player.new('player 1') }

  it 'should create a player' do
    expect(player.name).to eq('player 1')
  end

  it 'should increment player won game' do
    expect(player).to receive(:won_game).and_call_original
    player.won_game

    expect(player.games_won).to eq(1)
  end
end