gem 'minitest'
require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'

class ScrabbleTest < Minitest::Test
  def test_it_can_convert_a_full_word_into_an_array
    assert_equal ["A", "B", "C"], Scrabble.new.characters("ABC")
    assert_equal ["M", "A", "X"], Scrabble.new.characters("MAX")
  end

  def test_it_can_convert_any_letter_input_into_an_upcased_array
    assert_equal ["A", "B", "C"], Scrabble.new.characters("aBc")
    assert_equal ["M", "A", "X"], Scrabble.new.characters("MaX")
  end

  def test_it_can_eliminate_spaces_from_the_array
    assert_equal ["A", "B", "C", "M", "A", "X"], Scrabble.new.characters("abc max")
    assert_equal ["A", "B", "C", "M", "A", "X"], Scrabble.new.characters("AbC mAx")
  end

  def test_it_only_accepts_strings_or_nil
    assert_equal "You must enter letters", Scrabble.new.characters(123)
    assert_equal "You must enter letters", Scrabble.new.characters([123])
  end

  def test_it_can_convert_letters_to_scores
    assert_equal [1, 3, 3], Scrabble.new.convert_to_scores(["A", "B", "C"])
    assert_equal [3, 1, 8], Scrabble.new.convert_to_scores(["M", "A", "X"])
  end

  def test_it_scores_nil_as_0
    assert_equal 0, Scrabble.new.score(nil)
    assert_equal 0, Scrabble.new.score("")
    assert_equal 0, Scrabble.new.score
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_two_letters
    assert_equal 2, Scrabble.new.score("aa")
    assert_equal 18, Scrabble.new.score("zX")
  end

  def test_it_can_score_three_or_more_letters
    assert_equal 3, Scrabble.new.score("aaa")
    assert_equal 18, Scrabble.new.score("MaXiMuS")
  end

  def test_it_can_ignore_spaces
    assert_equal 18, Scrabble.new.score("Turing School")
  end
end
