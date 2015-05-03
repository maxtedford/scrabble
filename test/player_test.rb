gem 'minitest'
require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class PlayerTest < Minitest::Test

  def setup
    @player1 = Player.new("Max")
    @player2 = Player.new("Claire")
    @scrabble = Scrabble.new
  end

  def test_it_exists
    assert Player
  end

  def test_the_total_score_defaults_to_zero
    assert_equal 0, @player1.player_score
  end

  def test_the_score_can_be_accumulated_and_returned
    @player1.play("A")
    assert_equal 1, @player1.player_score
    assert_equal "Max's current score is 1.", @player1.print_current_score
  end

  def test_played_words_can_be_returned_for_each_player
    @player1.play("coding")
    @player1.play("is")
    @player1.play("fun")
    assert_equal ["coding", "is", "fun"], @player1.player_words
  end

  def test_scores_from_each_turn_can_be_returned
    @player1.play("coding")
    @player1.play("is")
    @player1.play("fun")
    assert_equal [10, 2, 6], @player1.player_scores
  end
end
