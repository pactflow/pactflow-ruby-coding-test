# frozen_string_literal: true

require './tennis_match.rb'

RSpec.describe TennisMatch do
  let(:match) { TennisMatch.new('Player A', 'Player B') }

  describe '#initialize' do
    context 'with valid player names' do
      it 'does not raise an error' do
        expect { match }.not_to raise_error
      end
    end

    context 'with empty player names' do
      it 'raises an ArgumentError' do
        expect { TennisMatch.new('', 'Player B') }.to raise_error(ArgumentError)
        expect { TennisMatch.new('Player A', '') }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#score' do
    context 'when the match is not over' do
      it 'returns the set score' do
        expect(match.score).to eq('Set score: Player A-Player B, match score: 0-0')
      end
    end

    context 'when the match is over' do
      it 'returns the winner' do
        match.instance_variable_set(:@match_winner, 'Player A')
        expect(match.score).to eq('Match over. Winner: Player A. Set score: Player A-Player B, match score: 0-0')
      end
    end
  end

  describe '#point_won_by' do
    context 'with valid player name' do
      it 'increases the score of the player' do
        match.point_won_by('Player A')
        expect(match.instance_variable_get(:@player1_score)).to eq(1)
      end
    end

    context 'with invalid player name' do
      it 'raises an ArgumentError' do
        expect { match.point_won_by('Unknown Player') }.to raise_error(ArgumentError)
      end
    end

    context 'when the match is already over' do
      it 'raises a StandardError' do
        match.instance_variable_set(:@match_winner, 'Player A')
        expect { match.point_won_by('Player A') }.to raise_error(StandardError)
      end
    end
  end
end
