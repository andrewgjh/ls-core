def double_odd_indicies!(num_array)
  current_index = 0
  while current_index <= num_array.size - 1
    if current_index.odd?
      num_array[current_index] *= 2
    end
    current_index += 1
  end
  num_array
end

def double_odd_indicies(num_arr)
  new_arr = []
  current_index = 0
  loop do
    if current_index.odd?
      new_arr << num_arr[current_index] * 2
    else
      new_arr << num_arr[current_index]
    end
    break if current_index >= num_arr.size - 1
    current_index += 1
  end
  new_arr
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indicies(my_numbers)
p my_numbers
