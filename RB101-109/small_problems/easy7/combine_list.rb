# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

# def interleave(arr1, arr2)
#   idx = 0
#   final_arr = []
#   while idx < arr1.size
#     final_arr << arr1[idx]
#     final_arr << arr2[idx]
#     idx += 1
#   end
#   final_arr
# end

def interleave(arr_one, arr_two)
  final_arr = []
  arr_one.zip(arr_two) { |sub_arr| final_arr.concat(sub_arr) }
  final_arr
end

def interleave(arr_one, arr_two)
  arr_one.zip(arr_two).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']
