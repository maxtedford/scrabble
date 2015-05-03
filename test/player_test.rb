gem 'minitest'
require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class PlayerTest < Minitest::Test

  def setup
    @player = Player.new("Max")
    @scrabble = Scrabble.new
  end

  def test_it_exists
    assert Player
  end

  def test_the_total_score_defaults_to_zero
    assert_equal 0, @player.player_score
  end

  def test_that_the_score_can_be_accumulated_and_returned
    @player.play("A")
    assert_equal 1, @player.player_score
    assert "Max's new score is 1."
  end
end
