=begin
INPUT is an array of integers

OUTPUT is an array of integers representing how many other numbers are larger than the number at that same index -- the return array should be of same size as input array ( use map)

* numbers that are the same should not be counted again when determining the numbers greater than iT

ALGO

iterate through the array of numbers using the map method with index 
slice all elements to the left of that element into array
and slice all elements to the right of that element and add them together
 then use select method on that new added array to find all numbers that are larger than the current element being iterated through by map. 
call uniq to remove any duplicates and them call size to get the number of elements in that array and return that to the map block



=end


# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

def smaller_numbers_than_current(int_arr)
  int_arr.map.with_index do |element, idx|
    left = int_arr[0, idx]
    right = int_arr[idx+1, int_arr.size]
    no_dup_nums = (left + right).uniq
    no_dup_nums.select {|num| num < element}.size
  end
end


p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".