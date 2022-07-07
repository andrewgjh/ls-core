# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

=begin
INPUT is an array of integers
OUTPUT is an array with two integers that represents the smallest difference between them compared to all other digits

ALGO
initialize a variable smallest_range and set to infinity
initialize an array with 2 elements, nil and nil - variable is close_nums
loop through elements with each
  nested loop through elements with each 
    get the abs difference between outer loop element an inner loop element 
    compare it to the smallest_range variable, 
    if it is smaller, then reset smallest_range to that range
      and set the outer element and inner element to the values in the return array (close_nums)
    
return close_nums when finished looping

=end

def closest_numbers(integer_arr)
  smallest_range = Float::INFINITY
  close_nums = [nil, nil]
  integer_arr.each_with_index do |outer_num, index|
    (index+1).upto(integer_arr.size - 1 ) do |inner_num_index|
      inner_num = integer_arr[inner_num_index]
      diff = (outer_num - inner_num).abs
      if diff < smallest_range
        smallest_range = diff 
        close_nums[0] = outer_num
        close_nums[1] = inner_num
      end
    end
  end
  close_nums
end
# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".