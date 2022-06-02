my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers!(num_array)
  current_index = 0
  while current_index <= num_array.size - 1
    num_array[current_index] *= 2
    current_index += 1
  end
  num_array
end
double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]

p my_numbers
