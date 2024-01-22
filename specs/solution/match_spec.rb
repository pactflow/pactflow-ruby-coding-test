# frozen_string_literal: true

require 'rspec'
require_relative '../../solution/match'

RSpec.describe Match do
  let(:player1) { 'Player 1' }
  let(:player2) { 'Player 2' }
  let(:match) { Match.new(player1, player2) }

  context 'regular scoring' do
    it 'scores 15-0 after player 1 wins one point' do
      match.point_won_by(player1)
      expect(match.score).to eq('0-0, 15-0')
    end

    it 'scores 30-15 after player 1 wins two points and player 2 wins one point' do
      match.point_won_by(player1)
      match.point_won_by(player1)
      match.point_won_by(player2)
      expect(match.score).to eq('0-0, 30-15')
    end
  end

  context 'deuce and advantage' do
    it 'scores Deuce after both players win at least 3 points' do
      match.point_won_by(player1)
      match.point_won_by(player1)
      match.point_won_by(player1)
      match.point_won_by(player2)
      match.point_won_by(player2)
      match.point_won_by(player2)
      expect(match.score).to eq('0-0, Deuce')
    end

    it 'scores Advantage Player 1 after Deuce when player 1 wins one more point' do
      match.point_won_by(player1)
      match.point_won_by(player1)
      match.point_won_by(player1)
      match.point_won_by(player2)
      match.point_won_by(player2)
      match.point_won_by(player2)
      match.point_won_by(player1)
      expect(match.score).to eq('0-0, Advantage Player 1')
    end
  end

  context 'winning the game' do
    it 'scores 2-0 after player 1 wins two games' do
      8.times { match.point_won_by(player1) }
      expect(match.score).to eq('2-0, 0-0')
    end

    it 'scores 1-1 after player 1 wins one game and player 2 wins one game' do
      4.times { match.point_won_by(player1) }
      4.times { match.point_won_by(player2) }
      expect(match.score).to eq('1-1, 0-0')
    end
  end
end
