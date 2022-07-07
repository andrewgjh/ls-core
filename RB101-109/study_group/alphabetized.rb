#  Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!
# The input is restricted to contain no numerals and only words containing the english alphabet letters.

# QUESTION
# should they be ordered by ascii order?
# meaning should capital char come before lowercase char

=begin
# ALGO
initialize an empty arr
initialize final string
use .chars on str to get array of each char
loop through each character in copied array
 and if character is alphabetic save character and its current index
call sort on the array of characters and their indexs based on the character
loop through sorted array and use the index to push char from original str into final str
return final str

=end

def alphabetized(str)
  final_str = ""
  char_arr = str.downcase.chars
  order_arr = []
  char_arr.each_with_index do |char, idx|
    if char.ord.between?(97, 122)
      char_obj = { character: char, index: idx }
      order_arr << char_obj
    end
  end
  order_arr.sort! { |a, b| a[:character] <=> b[:character] }
  order_arr.each { |obj| final_str << str[obj[:index]] }
  final_str
end

p alphabetized("The Holy Bible") #== "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"
