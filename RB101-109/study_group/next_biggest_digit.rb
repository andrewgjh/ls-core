# You have to create a method that takes a positive integer num and return the next biggest num formed by the same digits:


# INPUT is a positive integer

# OUTPUT is the next biggest number using the same digits or -1 if there is no bigger numbers

# ALGO
# create an array of all the possible numbers and sort them from smallest to largest
# if the input int is already the largest than return -1
# otherwise find the index of the current number and return the next num in the sorted array

# def all_possible_nums(arr_strnums)
#   num_perm = arr_strnums.permutation.to_a
#   num_perm.map do |arr_num|
#     arr_num.join.to_i
#   end
# end

# def next_biggest(num)
#   all_nums = all_possible_nums(num.digits).sort
#   return -1 if num == all_nums.last
#   next_num_index = all_nums.index(num) + 1
#   all_nums[next_num_index]
# end


def next_biggest(num)
  max_num = num.digits.sort {|a,b| b <=> a}.join.to_i
  return -1 if num == max_num
  next_num = -1
  (num + 1..max_num).to_a.each do |n|
    if n.digits.sort == num.digits.sort
      next_num = n
      break
    end
  end
  next_num
end


p next_biggest(12) == 21
p next_biggest(513) == 531
p next_biggest(2017) == 2071
p next_biggest(9) == -1
p next_biggest(111) == -1
p next_biggest(531) == -1
p next_biggest(123456789) == 123456798