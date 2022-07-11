=begin
INPUT is an array of integers
OUTPUT is an array of integers with 0 moved to the end of the array

ALGO
select all numbers that are not zero
find the size of that selected array and find the size of original array
find the difference and add that many zeros


=end

def moveZeros(arr_int)
  zero_removed = arr_int.select {|digits| digits != 0}
  num_zeros_required = arr_int.size - zero_removed.size
  zero_removed + [0] * num_zeros_required
end

p moveZeros([1,2,0,1,0,1,0,3,0,1]) == [ 1, 2, 1, 1, 3, 1, 0, 0, 0, 0 ]