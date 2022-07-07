def bubble_sort!(arr)
  loop do
    swaps = false
    n = arr.size - 1
    (1..n).each do |idx|
      if (arr[idx - 1] <=> arr[idx]) == 1
        arr[idx], arr[idx - 1] = arr[idx - 1], arr[idx]
        swaps = true
      end
    end
    n -= 1
    break unless swaps
  end
  arr
end






array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
