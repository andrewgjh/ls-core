=begin
INPUT is an array of integers
OUTPUT is an array with the same amount of integers where pairs are added together and a the second integer becomes zero

ALGO
initialize a return array = []
loop through the array and counter occurences of each integer and place inside a hash map

loop though the hash map and run divmod on each value 

[a,b]
where b is the number of the key to push to the return array
a is the number of the key double to push to the return array
a is also the number of 0s to push to the return array

return the new array by sorting number in reverse order

=end

# def merge(int_arr)
#   grouped_arr = []
#   count_occur = Hash.new(0)
#   int_arr.each { |el| count_occur[el] += 1 }
#   count_occur.each do |k, v|
#     answer = v.divmod(2)
#     a = answer[0]
#     b = answer[1]
#     b.times { grouped_arr << k }
#     a.times { grouped_arr << 0}
#     a.times { grouped_arr << k*2}
#   end
#   grouped_arr.sort { |a,b| b <=> a}
# end


def merge(row)
  nums = row.reject(&:zero?)
  p nums
  result = []
  result << (nums[0] == nums[1] ? nums.shift + nums.shift : nums.shift) while !nums.empty?
  result + [0] * (row.size - result.size)
end

merge([4, 16, 16, 32, 4, 32, 2, 8, 4, 2, 0, 32]) #== [4,2,0,0]
# p merge([2,0,2,2]) == [4,2,0,0]
# p merge([2,0,2,4]) == [4,4,0,0]
# p merge([0,0,2,2]) == [4,0,0,0]