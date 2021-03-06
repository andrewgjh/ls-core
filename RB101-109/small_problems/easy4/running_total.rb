# Write a method that takes an Array of numbers, and
# returns an Array with the same number of elements,
# and each element has the running total from the original Array.

# def running_total(arr_nums)
#   running_sum = 0
#   arr_nums.map do |num|
#     running_sum += num
#   end
# end

# def running_total(arr_nums)
#   arr_nums.each_with_object([]) do |num, arr|
#     arr.empty? ? arr << num : arr << num + arr[-1]
#   end
# end

def running_total(arr_nums)
  arr_nums.inject([]) do |mem, cur|
    if mem.empty?
      mem.push(cur)
    else
      mem.push(cur + mem[-1])
    end
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
