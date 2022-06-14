# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

def sum_of_sums(num_arr)
  added = num_arr.map.with_index do |_, idx|
    num_arr[0, idx + 1].sum
  end
  added.sum
end

def sum_of_sums(num_arr)
  final = 0
  num_arr.each_with_index do |cur, idx|
    final += cur * (num_arr.size - idx)
  end
  final
end


p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
