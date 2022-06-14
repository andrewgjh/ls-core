# Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

def palindrome?(str)
  str == str.reverse
end

def palindromic_number?(num)
  p num
  palindrome?(num.to_s)
end

# p palindromic_number?(34543) == true
# p palindromic_number?(123210) == false
# p palindromic_number?(22) == true
# p palindromic_number?(5) == true
p palindromic_number?(0o001000) == true
