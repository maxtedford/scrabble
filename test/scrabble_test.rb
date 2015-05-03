gem 'minitest'
require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/word'

class ScrabbleTest < Minitest::Test

  def setup
    @scrabble = Scrabble.new
  end

  def test_it_can_return_a_word_score
    assert_equal 1, @scrabble.score("A")
  end
end
