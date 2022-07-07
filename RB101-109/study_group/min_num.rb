# Given a List [] of n integers , find minimum number to be inserted in a list, so that sum of all elements of list should equal the closest prime number .

=begin
create function to check if it is a prime number
  use none? method (2...num)  % the digit is 0 

initialize to_add and set to 0
get sum of current integers in the input array 
use until loop and check is_prime? on sum + to_add
increment to_add

return to_add

=end

def is_prime?(int)
  (2...int).none? do |divisor|
    int % divisor == 0
  end
end


def minimum_number(array_ints)
  to_add = 0
  current_sum = array_ints.sum
  to_add += 1 until is_prime?(to_add + current_sum)
  to_add
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2