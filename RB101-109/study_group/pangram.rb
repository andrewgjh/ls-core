=begin
INPUT is a text string
OUTPUT is a boolean indiciated whether the input string used every single character in the alphabet a to z case insensitive

ALGO 
use all? method to check that string includes each of the characters from a - z in a range
=end

def pangram?(string)
  ("a".."z").to_a.all? do |char|
    string.downcase.include?(char)
  end
end

p pangram?('The quick brown fox jumps over the lazy dog.')