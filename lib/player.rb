require './lib/scrabble'
require 'pry'

class Player < Scrabble
attr_reader :player_score, :player_scores, :name, :player_words

  def initialize(name)
    @name = name
    @player_score = 0
    @player_scores = []
    @player_words = []
  end

  def play(word)
    @player_score += score(word)
    @player_scores << score(word)
    @player_words << word
  end

  def print_current_score
    "#{name}'s current score is #{player_score}."
  end
end
