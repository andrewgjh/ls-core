=begin

INPUT IS A string that consists of integer characters
OUTPUT is an integer representing the greatest product when taking all subsets of 5 consecutive integers

ALGO
initialize variable integer_substr and set to empty array
initialze index variable and set to 0
loop while condition is input string size - 5
  slice [index...index+5] and push to integer_substr array

use max_by method
  split each substr using char method and use inject on integer of each char

=end

# def greatest_product(string_int)
#   integer_substrs = []
#   index = 0
#   while index < string_int.size - 4
#     integer_substrs << string_int[index..index + 4]
#     index += 1
#   end
#   all_products = integer_substrs.map do |substr_int|
#     substr_int.chars.inject(1) { |mem, char| char.to_i * mem }
#   end
#   all_products.max
# end

def greatest_product(str)
  all_substr = str.chars.each_cons(5).map do |substr|
    substr.map(&:to_i).reduce(:*)
  end.max
end

p greatest_product('123456')

# p greatest_product("123834539327238239583") == 3240
# p greatest_product("395831238345393272382") == 3240
# p greatest_product("92494737828244222221111111532909999") == 5292
# p greatest_product("92494737828244222221111111532909999") == 5292
# p greatest_product("02494037820244202221011110532909999") == 0
