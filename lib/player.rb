require './lib/scrabble'
require 'pry'

class Player
attr_reader :total_score

  def initialize
    @total_score = 0
  end
end
