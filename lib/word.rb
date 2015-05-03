require 'pry'

class Word
attr_reader :word

  def initialize(word=nil)
    @word = word
    @timestamp = Time.now
  end

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

  def characters
    if word.class == String
      word.gsub(" ", "").upcase.chars
    else
      return "You must enter letters"
    end
  end

  def convert_to_scores
    if characters == "You must enter letters"
      return "You must enter letters"
    else
    characters.map{|letter| point_values[letter]}
    end
  end

  def word_score
    if word == nil || word.size == 0
      0
    else
      convert_to_scores.inject{|sum, score| sum + score}
    end
  end

  def double_word_score
    word_score*2
  end

  def triple_word_score
    word_score*3
  end
end
