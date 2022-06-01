my_numbers = [1, 4, 3, 7, 2, 6]


def multiply(nums, multiply_factor)
  multiplied_arr = []
  nums.each do |num|
    new_arr << num * multiply_factor
  end
  multiplied_arr
end

p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
