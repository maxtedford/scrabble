require './lib/scrabble'
require './lib/word'
require 'pry'

class Player < Scrabble
attr_reader :player_score, :player_scores, :name

  def initialize(name)
    @name = name
    @player_score = 0
    @player_scores = []
    @player_words = []
  end

  def play(word)
    @player_score += word.word_score
    @player_scores << word.word_score
    @player_words << word
  end

  def player_words
    @player_words.map{|word| word.word}
  end

  def print_current_score
    "#{name}'s current score is #{player_score}."
  end

  def nth_word_played(n)
    player_words[n-1]
  end

  def nth_score(n)
    player_scores[n-1]
  end

  def match_words_with_scores
    player_words.zip(player_scores)
  end

  def highest_scoring_word
    match_words_with_scores.max_by{|element| element[1]}[0]
  end
end
