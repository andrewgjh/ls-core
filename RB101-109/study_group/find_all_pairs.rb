# You are given array of integers, your task will be to count all pairs in that array and return their count.

# Notes:

#     Array can be empty or contain only one value; in this case return 0
#     If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
#     Random tests: maximum array length is 1000, range of values in array is between 0 and 1000


=begin

INPUT is an array of integers
OUTPUT is a integer representing the number of duplicate pairs in the input array
  each number can only be part of one pair

ALGO
intialize variable total and set to 0 
initialize hash map and count the occurence of each number
iterate through hash map with each method 
divide the value (/) by 2 and add that number to the total variable
return total variable
=end

def pairs(arr_int)
  total = 0
  num_occur = Hash.new(0)
  arr_int.each do |num|    
    num_occur[num] += 1
  end
  num_occur.each do |_,v|
    total += (v / 2)
  end
  total
end


p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0