gem 'minitest'
require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class PlayerTest < Minitest::Test

  def setup
    @player = Player.new
    @scrabble = Scrabble.new
  end

  def test_it_exists
    assert Player
  end

  def test_the_total_score_defaults_to_zero
    assert_equal 0, @player.total_score
  end

  def test_that_the_score_can_be_accumulated_and_returned
    @scrabble.score("A")
    assert_equal 1, @scrabble.total_score
  end
end
