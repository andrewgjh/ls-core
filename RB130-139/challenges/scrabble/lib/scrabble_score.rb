# # frozen_string_literal: true

module ScrabbleScore
  LEGEND = { 1 => "AEIOULNRST", 2 => "DG", 3 => "BCMP", 4 => "FHVWY", 5 => "K", 8 => "JX", 10 => "QZ" }.freeze
  def score(string=@string)
    tally = 0
    string.chars.each do |char|
      caps = char.upcase
      if ("A".."Z").member?(caps)
        tally += LEGEND.find { |_, v| v.include?(caps) }.first
      end
    end
    tally
  end
end

class Scrabble
  include ScrabbleScore
  extend ScrabbleScore

  def initialize(string)
    @string = string || ''
  end
end

# class Scrabble
#   attr_reader :word

#   POINTS = {
#     'AEIOULNRST'=> 1,
#     'DG' => 2,
#     'BCMP' => 3,
#     'FHVWY' => 4,
#     'K' => 5,
#     'JX' => 8,
#     'QZ' => 10
# }
#   def initialize(word)
#     @word = word ? word : ''
#   end

#   def score
#     letters = word.upcase.gsub(/[^A-Z]/, '').chars

#     total = 0
#     letters.each do |letter|
#       POINTS.each do |all_letters, point|
#         total += point if all_letters.include?(letter)
#       end
#     end
#     total
#   end

#   def self.score(word)
#     Scrabble.new(word).score
#   end
# end
