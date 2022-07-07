# Sum of Pairs

# Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.


=begin
INPUT is an array of integers and a single integer representing the target sum
OUTPUT is an array with two integer representing the first two numbers encountered in the original array that add up to the target sum
return nil if there is numbers that add up to the target sum

ALGO

create outer loop that iterates through each element in the array
create inner loop that starts at the next index in the array
add the two elements together and check if it adds up to the target sum
if target sum reached return the two digits

at the end of both loops return nil


SECOND ALGO

loop through the array once
understand what number is needed to get the target sum 
find index second number 
if found save the indices


=end

# def sum_pairs(ints, s)
#   pairs = {}
#   ints.size.times do |outer|
#     (outer+1).upto(ints.size - 1) do |inner|
#       first_num = ints[outer]
#       second_num = ints[inner]
#       if first_num + second_num == s
#         pairs[[outer,inner]] = [first_num, second_num]
#       end
#     end
#   end
#   pairs.empty? ? nil : pairs.min_by { |k,v| k.max }.last
# end


def sum_pairs(arr_int, target_sum)
  indices_pairs = []
  arr_int.each_with_index do |el, first_idx|
    num_required = target_sum - el
    second_idx = arr_int.index(num_required)
    indices_pairs << [first_idx, second_idx] if first_idx != second_idx && second_idx != nil
  end
  return nil if indices_pairs.empty?
  indices_pairs.min_by { |pair| pair.max }.map {|idx| arr_int[idx]}
end




l1 = [1, 4, 8, 7, 3, 15]
l2 = [1, -2, 3, 0, -6, 1]
l3 = [20, -13, 40]
l4 = [1, 2, 3, 4, 1, 0]
l5 = [10, 5, 2, 3, 7, 5]
l6 = [4, -2, 3, 3, 4]
l7 = [0, 2, 0]
l8 = [5, 9, 13, -3]


p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]
p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]
p sum_pairs(l6, 8) == [4, 4]
p sum_pairs(l7, 0) == [0, 0]
p sum_pairs(l8, 10) == [13, -3]