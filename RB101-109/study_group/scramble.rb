=begin
write a function scramble (str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise return false

example str1 is rkqodlw and str2 is world the output is true


INPUT is two strings with only lowercase letters with no punctuation and no digits

OUTPUT is a boolean indicating whether str1 has all the necessary characters to be rearranged to recreate str2

ALGO
initialize a flag variable named characters_required and set to true

create seperate method that creates a hash map of all the chracter and their number of occurences return the hash map

run the seperate method and store the value of str1 and str2

iterate through the hash map of str2 and check the character key on hash map of str1 to see if the value of str1 is greater or equal to the value of str2
if greater or equal then continue to next iteration
  if less than change flag to false break from the iteration 

return the flag


=end

def scramble(str1, str2)
  str2_map = letter_occurences(str2)
  str1_map = letter_occurences(str1)
  str2_map.each do |letter, occurences|
    return false if str1_map[letter] < occurences
  end
  true
end

def letter_occurences(str)
  occur_map = Hash.new(0)
  str.chars.each do |character|
    occur_map[character] += 1
  end
  occur_map
end




p scramble("javaass", "jjss") == false
p scramble("rkqodlw", "world") == true
p scramble("cedewaraaossoqqyt", "codewars") == true
p scramble("katas", "steak") == false
p scramble("scriptjava", "javascript") == true
p scramble("scriptingjava", "javascript") == true
