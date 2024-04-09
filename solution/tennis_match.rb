require_relative 'score_mapping' 
require_relative 'game_score_updater'
require_relative 'score_calculator'

class TennisMatch
  include ScoreMapping
  include GameScoreUpdater
  include ScoreCalculator

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_score = 0
    @player2_score = 0
    @game_score = [0, 0]
  end

  def pointWonBy(player)
    if player == @player1
      @player1_score += 1
    elsif player == @player2
      @player2_score += 1
    else
      raise ArgumentError, "Invalid player"
    end

    update_game_score(@player1_score, @player2_score, @game_score)
  end

  def score
    calculate_score(@player1_score, @player2_score)
  end
end

