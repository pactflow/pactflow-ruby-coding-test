describe 'player object initialize' do
  it 'should create a player' do
    player = Player.new('player 1')
    expect(player.name).to eq('player 1')
  end
end