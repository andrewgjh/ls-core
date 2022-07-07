=begin
INPUT is a string text
OUTPUT is an array with two elements, first being the minimum length substring and second the number of times it repeats

QUESTION are there extra letters? or does the string always duplicate
ALGO
initialize a variable min_substr set to nil
initialize a variable substr_occurences set to 0
turn string into chars array variable = string_chars
1.upto chars array.size loop
  use each_slice method on string_chars 
  .map each new array and join back into a string
  then uniq method and and check if there is only one element
  if there is then use scan method to check how many times it occurs in original string
    if occureance is higher than what is stored in substr_occurences then reset min_substr and substr_occurences 
  
return min_substr and substr_occurences
=end

def f(s)
  min_substr = nil
  substr_occurences = 0
  string_chars = s.chars
  1.upto(string_chars.size) do |divisor|
    slices = string_chars.each_slice(divisor).map(&:join)
    possible_substr = slices.uniq
    if possible_substr.size == 1
      possible_substr_occurence = s.scan(possible_substr[0]).size
      if possible_substr_occurence > substr_occurences
        substr_occurences = possible_substr_occurence
        min_substr = possible_substr[0] 
      end
    end
  end
  [min_substr, substr_occurences]
end


p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]