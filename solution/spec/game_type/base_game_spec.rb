describe 'base game' do

  let(:player_1) { Player.new('player_1') }
  let(:player_2) { Player.new('player_2') }
  let(:game) { GameType::BaseGame.new(player_1, player_2) }


  it 'checks for player 1 score after increment' do
    game.point_won_by(player_1)
    expect(game.all_scores).to eq([1, 0])

    expect(game.max_score).to eq(1)
    expect(game.min_score).to eq(0)
  end

  it 'checks for player 2 score after increment' do
    game.point_won_by(player_2)
    expect(game.all_scores).to eq([0, 1])
  end

  it 'checks for unimplemented methods' do
    expect { game.score }.to raise_exception(NotImplementedError)
    expect { game.winner }.to raise_exception(NotImplementedError)
  end

end
