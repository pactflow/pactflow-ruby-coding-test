require_relative "../player.rb"
RSpec.describe Player do
    let(:player) { Player.new('Player 1') }
  
    context 'when initialized' do
      it 'has the correct attributes' do
        expect(player.name).to eq('Player 1')
        expect(player.score).to eq(0)
        expect(player.games_won).to eq(0)
        expect(player.tie_break_score).to eq(0)
      end
    end
  
    context 'when winning points' do
      it 'increments the score by 1' do
        expect { player.win_point }.to change { player.score }.by(1)
      end
    end
  
    context 'when winning games' do
      before do
        player.win_point
      end
  
      it 'increments games_won by 1' do
        expect { player.win_game }.to change { player.games_won }.by(1)
      end
  
      it 'resets scores' do
        player.win_game
        expect(player.score).to eq(0)
        expect(player.tie_break_score).to eq(0)
      end
    end
  end