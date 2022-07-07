=begin
INPUT is two arrays of integers
OUTPUT is a boolean flag represent whether 
array1 digits matches array2 when squared (order of the digit does not matter)

ALGO
first check that arr1 and arr2 size is the same
then make a copy of arr2
iterate through arr1 and square each element and look for the same number in copied arr2 and delete it
at the end of the looping, if copy of arr2 is empty then return true else false


=end

def comp(arr1, arr2)
  return false if arr1.size != arr2.size
  arr2_copy = arr2.dup
  arr1.each do |num|
    squared = num * num
    index = arr2_copy.index(squared)
    arr2_copy.delete_at(index) unless index == nil
  end
  arr2_copy.empty?
end

# def comp(array1, array2)
#   return true if array1.empty? && array2.empty?
#   array1.sort!
#   array2.sort!
#   index = -1 
#   array1.all? do |num| 
#     index += 1
#     num * num == array2[index] 
#   end
# end

arr1 = [121, 144, 19, 161, 19, 144, 19, 11]
arr2 = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
p comp(arr1, arr2 ) == true