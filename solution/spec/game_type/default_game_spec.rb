describe 'normal game' do

  let(:player_1) { Player.new('player_1') }
  let(:player_2) { Player.new('player_2') }
  let(:game) { GameType::DefaultGame.new(player_1, player_2) }

  it 'should check for score after multiple points increment, and winner is player 1' do
    expect(game.score).to eq('0-0')

    game.point_won_by(player_1)
    expect(game.score).to eq('15-0')

    game.point_won_by(player_2)
    expect(game.score).to eq('15-15')

    expect(game.winner).to eq(nil)

    game.point_won_by(player_1)
    expect(game.score).to eq('30-15')

    expect(game.winner).to eq(nil)

    game.point_won_by(player_1)
    expect(game.score).to eq('40-15')

    game.point_won_by(player_1)
    expect(game.winner).to eq(player_1)
  end

  it 'should check for Deuce score' do
    expect(game.score).to eq('0-0')

    3.times { game.point_won_by(player_1) }
    3.times { game.point_won_by(player_2) }

    expect(game.score).to eq('Deuce')
  end

  it 'should check for Advantage score, player 1' do
    expect(game.score).to eq('0-0')

    4.times { game.point_won_by(player_1) }
    3.times { game.point_won_by(player_2) }

    expect(game.score).to eq('Advantage player_1')
    expect(game.winner).to eq(nil)
  end

  it 'should check for Advantage score, player 2' do
    expect(game.score).to eq('0-0')

    3.times { game.point_won_by(player_1) }
    4.times { game.point_won_by(player_2) }

    expect(game.score).to eq('Advantage player_2')
    expect(game.winner).to eq(nil)
  end

end
