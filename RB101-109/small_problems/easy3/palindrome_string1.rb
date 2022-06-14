# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

# def palindrome?(str)
#   left = 0
#   right = str.size - 1
#   while left <= right
#     return false if str[left] != str[right]
#     left += 1
#     right -= 1
#   end
#   true
# end

# def palindrome?(str)
#   str == str.reverse
# end

def palindromic(arr_or_str)
  arr_or_str == arr_or_str.reverse
end

# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true
