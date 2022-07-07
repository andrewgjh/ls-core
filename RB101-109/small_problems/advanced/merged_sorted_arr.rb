def merge(arr1, arr2)
  final = []
  index_one = 0
  index_two = 0

  until (index_one >= arr1.size) || (index_two >= arr2.size) 
    case arr1[index_one] <=> arr2[index_two] 
    when 1 
      final << arr2[index_two]
      index_two += 1
    when -1
      final << arr1[index_one]
      index_one += 1
    when 0
      final << arr2[index_two]
      index_two += 1
    end  
  end
  final += arr1[index_one..-1]
  final += arr2[index_two..-1]
  final
end


# def merge(array1, array2)
#   index2 = 0
#   result = []

#   array1.each do |value|
#     while index2 < array2.size && array2[index2] <= value
#       result << array2[index2]
#       index2 += 1
#     end
#     result << value
#   end

#   result.concat(array2[index2..-1])
# end


# p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]