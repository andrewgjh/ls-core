# Count the number of Duplicates

# Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

=begin

INPUT is a string
OUTPUT is an integer representing the number of characters that occur more than one time

ALGO

split the string using chars to get an array and use group_by to group each character after being downcase

then count all values that are 2 or greater

=end

def duplicate_count(str)
  grouped = str.chars.group_by {|char| char.downcase}
  grouped.count {|_,v| v.size >= 2}
end


p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2