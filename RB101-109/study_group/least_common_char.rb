# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

=begin
INPUT is a string 
OUTPUT is a single string character representing the least frequently occuring char
  if there are two character of the same frequency which represent the least then return the one that came first in the original string

ALGO 
  initialize a hash map and set default to 0 

  turn downcase string into chars array and iterate through each character and add one to each character that is encountered
  
  call min on the hash map and call first to get the key

=end

# Examples:

def least_common_char(text)
  letter_occurences = Hash.new(0)
  text.downcase.chars.each do |char|
    letter_occurences[char] += 1
  end
  letter_occurences.min_by {|_,v| v}.first
end

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

# The tests above should print "true".