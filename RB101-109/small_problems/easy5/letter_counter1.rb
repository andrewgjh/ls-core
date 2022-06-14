# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# def word_sizes(sentence)
#   final_count = sentence.split.reduce({}) do |acc, cur|
#     char_count = cur.size
#     acc[char_count] ||= 0
#     acc[char_count] += 1
#     acc
#   end
#   p final_count
# end

# def word_sizes(sentence)
#   sentence.split.each_with_object({}) do |str, hsh|
#     char_count = str.size
#     if hsh[char_count]
#       hsh[char_count] += 1
#     else
#       hsh[char_count] = 1
#     end
#   end
# end

def word_sizes(text)
  counts = Hash.new(0)
  text.split.each { |word| counts[word.size] += 1 }
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
