# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.


# def oddities(arr)
#   arr.select.with_index{|_, idx| idx.even?}
# end

# def oddities(arr)
#   return_arr = []
#   arr.each_with_index do |num, idx|
#     if idx % 2 == 0
#       return_arr.push(num)
#     end
#   end
#   return_arr
# end


def oddities(arr)
  counter = 0
  final_arr = []
  while counter < arr.size
    final_arr << arr[counter]
    counter += 2
  end
  final_arr
end

def even_steven(arr)
  arr.select.with_index{|_, idx| idx.odd?}
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
