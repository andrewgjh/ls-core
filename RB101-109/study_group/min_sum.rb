# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

=begin
INPUT is an array of integers

OUTPUT is an integer representing the smaller sum of taking 5 of those integers

EDGE CASES
if there are less than 5 elements in the input array than return nil

ALGO
check that there are 5 or more elements, if not then return nil

get all sub arrays of 5 elements
intialize subarray and set to []
initialize variable (index) and set to 0
start a while loop condition to break is when index is input array size - 6
  slice from current [index, index + 5] and push to subarray
  
  increment by 1 at the end of while loop
use min to get the smallest sum amongst those subarrays
and then call sum on the returned subarray
=end


def minimum_sum(int_arr)
  return nil if int_arr.size < 5
  index = 0
  sub_arrays = []

  while index <= int_arr.size - 5
    sub_arrays << int_arr[index..index + 4]
    index += 1
  end
  sub_arrays.min_by {|arr| arr.sum}.sum
end


p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".