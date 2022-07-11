# Given an array (or list) of scores, return the array of ranks for each value in the array. The largest value has rank 1, the second largest value has rank 2, and so on. Ties should be handled by assigning the same rank to all tied values. For example:

# ranks([9,3,6,10]) = [2,4,3,1]

# and

# ranks([3,3,3,3,3,5,1]) = [2,2,2,2,2,1,7]

# because there is one 1st place value, a five-way tie for 2nd place, and one in 7th place.


=begin
INPUT is an array of integers
OUTPUT is an array of integers representing the element of the input array ranked from highest to smallest
same numbers are given the same rank but the next rank will take into account the arrays length

ALGO
  call map on the input array
    within the block, sort the input array and find the index of the first number that equal to the that iteration
    add 1 to the that index and return
    

  

=end


def ranks(a)
  a.map {|num| a.sort.reverse.index(num) + 1}
end


p ranks([]) == []
p ranks([2]) == [1]
p ranks([2,2]) == [1,1]
p ranks([9,3,6,10]) == [2,4,3,1]
p ranks([3,3,3,3,3,5,1]) == [2,2,2,2,2,1,7]