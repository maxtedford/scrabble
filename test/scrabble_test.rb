gem 'minitest'
require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'

class ScrabbleTest < Minitest::Test

  def setup
    @scrabble = Scrabble.new
  end

  def test_it_can_convert_a_full_word_into_an_array
    assert_equal ["A", "B", "C"], @scrabble.characters("ABC")
    assert_equal ["M", "A", "X"], @scrabble.characters("MAX")
  end

  def test_it_can_convert_any_letter_input_into_an_upcased_array
    assert_equal ["A", "B", "C"], @scrabble.characters("aBc")
    assert_equal ["M", "A", "X"], @scrabble.characters("MaX")
  end

  def test_it_can_eliminate_spaces_from_the_array
    assert_equal ["A", "B", "C", "M", "A", "X"], @scrabble.characters("abc max")
    assert_equal ["A", "B", "C", "M", "A", "X"], @scrabble.characters("AbC mAx")
  end

  def test_it_only_accepts_strings_or_nil
    assert_equal "You must enter letters", @scrabble.characters(123)
    assert_equal "You must enter letters", @scrabble.characters([123])
  end

  def test_it_can_convert_letters_to_scores
    assert_equal [1, 3, 3], @scrabble.convert_to_scores(["A", "B", "C"])
    assert_equal [3, 1, 8], @scrabble.convert_to_scores(["M", "A", "X"])
  end

  def test_it_scores_nil_as_0
    assert_equal 0, @scrabble.score(nil)
    assert_equal 0, @scrabble.score("")
    assert_equal 0, @scrabble.score
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, @scrabble.score("a")
    assert_equal 4, @scrabble.score("f")
  end

  def test_it_can_score_two_letters
    assert_equal 2, @scrabble.score("aa")
    assert_equal 18, @scrabble.score("zX")
  end

  def test_it_can_score_three_or_more_letters
    assert_equal 3, @scrabble.score("aaa")
    assert_equal 18, @scrabble.score("MaXiMuS")
  end

  def test_it_can_ignore_spaces
    assert_equal 18, @scrabble.score("Turing School")
  end
end
