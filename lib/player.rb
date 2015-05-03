require './lib/scrabble'
require 'pry'

class Player < Scrabble
attr_reader :player_score, :name, :player_words

  def initialize(name)
    @name = name
    @player_score = 0
    @player_words = []
  end

  def play(word)
    @player_score += score(word)
    @player_words << word
    puts "#{@name}'s new score is #{@player_score}."
  end
end
