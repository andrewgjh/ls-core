# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.
require 'pry-byebug'
def stringy(int)
  counter = 0
  final_str = ""
  binary_arr = ['1','0']
  while counter < int
    final_str << binary_arr[counter % 2]
    counter += 1
  end
  final_str
end

def stringy1(int, first=1)
  num_arr = []
  second = first == 1 ? 0 : 1
  int.times do |idx|
    bin = idx.even? ? first : second
    num_arr << bin
  end
  num_arr.join
end

puts stringy1(6) == '101010'
puts stringy1(9) == '101010101'
puts stringy1(4) == '1010'
puts stringy1(7) == '1010101'
