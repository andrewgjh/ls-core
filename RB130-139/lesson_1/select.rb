def select(arr)
  counter = 0
  selected_arr = []
  while counter < arr.size
    selected_arr << arr[counter] if yield arr[counter]
    counter += 1
  end
  selected_arr
end

a = select([1, 2, 3, 4, 5, 6, 7, 8]) { |num| puts num }
p a
