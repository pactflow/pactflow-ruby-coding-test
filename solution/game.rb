class Game
  POINTS_MAP = { 0 => 0, 1 => 15, 2 => 30, 3 => 40 }
  DEUCE = 'deuce'.freeze

  attr_reader :player_1_score, :player_2_score

  def initialize(player_1_name, player_2_name)
    @player_1_score = 0
    @player_2_score = 0
    @adv_player_1 = "Advantage #{player_1_name}"
    @adv_player_2 = "Advantage #{player_2_name}"
  end

  def score(is_tie_break)
    winning_margin = is_tie_break.nil? ? 3 : 7
    if player_1_score >= winning_margin && player_2_score >= winning_margin
      advantage_score
    else
      is_tie_break.nil? ? "#{POINTS_MAP[player_1_score]}-#{POINTS_MAP[player_2_score]}" : "#{player_1_score}-#{player_2_score}"
    end
  end

  def add_point(add_to_player_1)
    add_to_player_1 ? (@player_1_score += 1) : (@player_2_score += 1)
  end

  def reset
    @player_1_score = @player_2_score = 0
  end

  private

  def advantage_score
    return DEUCE if player_1_score == player_2_score
    player_1_score > player_2_score ? @adv_player_1 : @adv_player_2
  end
end
