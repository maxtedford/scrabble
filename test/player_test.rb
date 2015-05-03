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
    word = Word.new("A")
    @player1.play(word)
    assert_equal 1, @player1.player_score
    assert_equal "Max's current score is 1.", @player1.print_current_score
  end

  def test_played_words_can_be_returned_for_each_player
    @player1.play(Word.new("coding"))
    @player1.play(Word.new("is"))
    @player1.play(Word.new("fun"))
    assert_equal ["coding", "is", "fun"], @player1.player_words
  end

  def test_scores_from_each_turn_can_be_returned
    @player1.play(Word.new("coding"))
    @player1.play(Word.new("is"))
    @player1.play(Word.new("fun"))
    assert_equal [10, 2, 6], @player1.player_scores
  end

  def test_it_can_return_the_nth_word_played_by_that_player
    @player1.play(Word.new("coding"))
    @player1.play(Word.new("is"))
    @player1.play(Word.new("fun"))
    assert_equal "coding", @player1.nth_word_played(1)
    assert_equal "fun", @player1.nth_word_played(3)
  end

  def test_it_can_return_the_nth_score_by_that_player
    @player1.play(Word.new("coding"))
    @player1.play(Word.new("is"))
    @player1.play(Word.new("fun"))
    assert_equal 10, @player1.nth_score(1)
    assert_equal 6, @player1.nth_score(3)
  end

  def test_it_can_match_words_played_with_their_scores
    @player1.play(Word.new("coding"))
    @player1.play(Word.new("is"))
    @player1.play(Word.new("fun"))
    assert_equal [["coding", 10], ["is", 2], ["fun", 6]], @player1.match_words_with_scores
  end

  def test_it_can_return_the_highest_scoring_word
    @player1.play(Word.new("coding"))
    @player1.play(Word.new("is"))
    @player1.play(Word.new("fun"))
    assert_equal "coding", @player1.highest_scoring_word
  end
end
