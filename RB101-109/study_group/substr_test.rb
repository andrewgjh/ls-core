# given 2 strings, your job is to find out if there is a substr that appears in both strings, you will return true if you find a substr that appears in both strings or false if you do not 
# we only care about substrings that are longer than one character

=begin
INPUT is two strings, strings can be empty
OUTPUT is a boolean to indicate whether a substring of 2 characters of more occur in both input strings
ALGO
initialize a flag or matching substring and set to false


create method to find all substr of a str with two 
characters and return in an array (downcase both strings)

using the array of the shorter word,
iterate through each substr and see if the element is included in the longer substring array
  if it is included changed the matching substr flag to true

return the flag

method for finding all substr of two characters
  initialize an empty array of 2 characters
  downcase the word
  iterate from first character to second last character
  slice the character at the current index and next index and push to array of two characters
  return the array
=end

def substr_test(str1, str2)
  
  matching_substr = false
  shorter_word_substr = subarray_two_chars([str1,str2].min)
  longer_word_substr = subarray_two_chars([str1,str2].max)
  shorter_word_substr.each do |sub_str|
    matching_substr = true if longer_word_substr.include?(sub_str)
  end
  matching_substr
end


def subarray_two_chars(str)
  two_char_array = []
  lowercase_str = str.downcase
  (0..str.size - 2).each do |index|
    two_char_array << lowercase_str[index..index + 1]
  end
  two_char_array
end



p substr_test("Something", "Fun") == false
p substr_test("Something", "Home") == true
p substr_test("Something", "") == false
p substr_test("", "Fun") == false
p substr_test("BANANA", "banana") == true
p substr_test("test", "lllt") == false
p substr_test("", "") == false
p substr_test("1234567", "541265") == true
p substr_test("supercalifragilisticexpialidocious", "SoundOfItIsAtrociou") == true
