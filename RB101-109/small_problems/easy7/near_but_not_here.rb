# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(text)
  text.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

# What is middle when the phase has even number of words? - take the word closest to the end of the array

# what happens when there are no words? return nil

def middle_word(text)
  return nil if text.size == 0
  word_arr = text.split
  middle = (word_arr.size / 2.0).ceil(0)
  word_arr[middle]
end

p middle_word("")
p middle_word("I am the best")
p middle_word("I am the best man")
