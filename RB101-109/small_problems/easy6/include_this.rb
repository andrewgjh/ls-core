# Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

# def include?(arr, search_el)
#   arr.any? {|el| el == search_el}
# end

def include?(arr, search_el)
  found = false
  arr.each { |el| found = true if el == search_el }
  found
end

def include?(array, value)
  !!array.find_index(value)
end

p include?([1, 2, 3, 4, 5], 3) == true
p include?([1, 2, 3, 4, 5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
