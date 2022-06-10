# Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# def reverse_words(str)
#   reverse_str = ""
#   str_arr = str.split("")
#   while str_arr.size > 0
#     reverse_str << str_arr.pop
#   end
#   reverse_str
# end

# def reverse_words!(str)
#   left = 0
#   right = str.size - 1
#   while left < right
#     left_char = str[left]
#     right_char = str[right]
#     str[left] = right_char
#     str[right] = left_char
#     left += 1
#     right -= 1
#   end
#   str
# end

def reverse_words(str)
  word_arr = str.split
  word_arr.each {|word| word.reverse!}
  word_arr.join(" ")
end



puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')       