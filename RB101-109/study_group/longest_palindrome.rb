=begin
Find the length of the longest substring in the given string that is the same in reverse

as an example if the input was I like racecars that go fast, the substring length would be 7 (racecar)
INPUT is a string

OUTPUT is an integer that represents the length of the longest substr that is a palindrome

ALGO

create a method that stores an array of all substr of the given str that are palindromes

call max_by on the given array and


method for array of substr palindromes
initialize an empty array of substrings
  str size times loop through the string
  then using current index up to size of string call each method and slice the original str
  check to if the slice str is a palindrome,
  if yes push to substr array

 return substr array

=end

def palindrome_substrs(str)
  all_palindromes = []
  str.size.times do |starting|
    starting.upto(str.size) do |ending|
      sub_str = str[starting..ending]
      all_palindromes << sub_str if is_palindrome?(sub_str)
    end
  end
  all_palindromes
end

def is_palindrome?(str)
  str == str.reverse
end


def longest_palindrome(str)
  substr_palindromes = palindrome_substrs(str)
  return 0 if substr_palindromes.empty?
  substr_palindromes.max_by {|palindrome| palindrome.size}.size
end

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9


# p palindrome_substrs("123321")
# p longest_palindrome("")