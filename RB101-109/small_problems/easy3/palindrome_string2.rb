# Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

def palindrome?(str)
  str == str.reverse
end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

# def real_palindrome?(str)
#   only_alphanum_str = ""
#   str.chars.each do |char|
#     char.downcase!
#     if char.ord.between?(97, 122)
#       only_alphanum_str << char
#     end
#   end
#   only_alphanum_str == only_alphanum_str.reverse
# end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
