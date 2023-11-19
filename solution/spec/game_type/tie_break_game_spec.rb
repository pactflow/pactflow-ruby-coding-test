describe 'tie break game' do

  let(:player_1) { Player.new('player_1') }
  let(:player_2) { Player.new('player_2') }
  let(:game) { GameType::TieBreakGame.new(player_1, player_2) }

  it 'should check for score below 7' do
    5.times { game.point_won_by(player_1) }
    6.times { game.point_won_by(player_2) }

    expect(game.score).to eq('TieBreak: 5-6')
    expect(game.winner).to eq(nil)
  end

  it 'should check winning score and player 1 is winner' do
    7.times { game.point_won_by(player_1) }
    5.times { game.point_won_by(player_2) }

    expect(game.score).to eq('TieBreak: 7-5')
    expect(game.winner).to eq(player_1)
  end

end
