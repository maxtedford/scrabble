gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/word'

class WordTest < MiniTest::Test

  def test_it_exists
    assert Word
  end

  def test_it_can_convert_a_full_word_into_an_array
    assert_equal ["A", "B", "C"], Word.new("ABC").characters
    assert_equal ["M", "A", "X"], Word.new("MAX").characters
  end

  def test_it_can_convert_any_letter_input_into_an_upcased_array
    assert_equal ["A", "B", "C"], Word.new("aBc").characters
    assert_equal ["M", "A", "X"], Word.new("MaX").characters
  end

  def test_it_can_eliminate_spaces_from_the_array
    assert_equal ["A", "B", "C", "M", "A", "X"], Word.new("abc max").characters
    assert_equal ["A", "B", "C", "M", "A", "X"], Word.new("AbC mAx").characters
  end

  def test_it_only_accepts_strings_or_nil
    assert_equal "You must enter letters", Word.new(123).characters
    assert_equal "You must enter letters", Word.new([123]).characters
  end

  def test_it_can_convert_letters_to_scores
    assert_equal [1, 3, 3], Word.new("abc").convert_to_scores
    assert_equal [3, 1, 8], Word.new("Max").convert_to_scores
  end

  def test_it_scores_nil_as_0
    assert_equal 0, Word.new(nil).word_score
    assert_equal 0, Word.new("").word_score
    assert_equal 0, Word.new.word_score
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, Word.new("a").word_score
    assert_equal 4, Word.new("f").word_score
  end

  def test_it_can_score_two_letters
    assert_equal 2, Word.new("aa").word_score
    assert_equal 18, Word.new("zX").word_score
  end

  def test_it_can_score_three_or_more_letters
    assert_equal 3, Word.new("aaa").word_score
    assert_equal 18, Word.new("MaXiMuS").word_score
  end

  def test_it_can_ignore_spaces
    assert_equal 18, Word.new("Turing School").word_score
  end
end
