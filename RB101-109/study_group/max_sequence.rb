# the maximum sum subarray problem consists in finding the max sum of a continguous subseqiuence in an array of ints

# maxSeq [-2,1,-3,4,-1,2,1,-5,4] should be 6 [4,-1,2,1]
# easy case is when the array is made up of only positive nums and the maximum sum is the sum of the whole array
# if the array is made up of only negative number return 0
# empty array is considered to have zero greatest sum. note that the empty array is also a valid subarray

#INPUT is an array of integers can be both positive or negative, the array can also be empty

#OUTPUT is an integer that is either 0 or the highest positive integer sum of a subarray 

#ALGO
#find all subarrays and the sum of the digits and get the max and retrun

def max_sequence(arr)
  all_subs = []
  (arr.size).times do |starting_index|
    starting_index.upto(arr.size) do |ending_index|
      all_subs.push(arr[starting_index, ending_index].sum)
    end
  end
  return 0 if arr.empty?
  all_subs.max
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
