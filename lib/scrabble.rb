require_relative 'player'
require 'pry'

class Scrabble

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def characters(letters)
    if letters.class == String
      letters.gsub(" ", "").upcase.chars
    else
      "You must enter letters"
    end
  end

  def convert_to_scores(letter_collection)
    letter_collection.map{|letter| point_values[letter]}
  end

  def score(letters = nil)
    if letters == nil
      0
    else
    convert_to_scores(characters(letters)).inject{|sum, score| sum + score}
    end
  end
end
