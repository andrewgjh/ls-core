=begin
input is an array of integers
output is an array where the first element is either a subarr with max sum or array of subarrs if there is more than one subarr with the same max sum, and the second element is the total of the max sum

algo
create all subarrs

call max to find the first maximum subarray
then all select to get all of them 
=end


def find_subarr_maxsum(arr)
  subarrs = []
  1.upto(arr.size) do |subarr_size|
    subarrs += arr.each_cons(subarr_size).to_a
  end
  max_sum = subarrs.max_by {|sub_arr| sub_arr.sum}.sum
  all = subarrs.select {|sub_arr| sub_arr.sum == max_sum}
  if max_sum > 0
  [all.size == 1 ? all.flatten : all , max_sum]
  else
  [[],0]
  end
end


p find_subarr_maxsum([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == [[4, -1, 2, 1], 6]
p find_subarr_maxsum([4, -1, 2, 1, -40, 1, 2, -1, 4]) == [[[4, -1, 2, 1], [1, 2, -1, 4]], 6]  # From left to right [4, -1, 2, 1] appears in the array before than [1, 2, -1, 4].

arr = [-4, -1, -2, -1, -40, -1, -2, -1, -4]
p find_subarr_maxsum(arr) == [[], 0]

arr = [2, 1, 3, 4, 1, 2, 1, 5, 4]
p find_subarr_maxsum(arr) == [[2, 1, 3, 4, 1, 2, 1, 5, 4], 23]