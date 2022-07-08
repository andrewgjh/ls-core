# The number 12 is the first number in having six divisors, they are: 1, 2, 3, 4, 6 and 12. Your challenge for this kata is to find the minimum number that has a certain number of divisors. For this purpose we have to create the function

# find_min_num() or findMinNum() or similar in the other languages

# that receives the wanted number of divisors num_div, and outputs the smallest number having an amount of divisors equals to num_div.

=begin

INPUT is a integer indicated the number of divisors a certain number will have

OUTPUT is the smallest integer that matches the input number of divisors

ALGO
initial starting_num = 1 
num_divisors = 0 
loop until num_divisors is equal to input integer
reset num_divisors
  1.upto(starting_num)loop
    increment num_divisors by 1everytime the current iteration modulo equals zero
  starting_num increments 1 
return starting num

SECOND ALGO


=end

# def find_min_num(num)
#   starting_num = 1
#   loop do
#     break if num_divisors(starting_num) == num
#     starting_num += 1
#   end
#   starting_num
# end

def find_min_num(num)
  1.step.find do |number|
    num == num_divisors(number)
  end
end



def num_divisors(number)
  total = 0
  ending = Math.sqrt(number).to_i
  1.upto(ending) do |x|
    if number % x == 0
      number / x == x ? total += 1 : total += 2 
    end
  end
  total
end

# p num_divisors(2)

# def find_min_num(num)
#   starting_num = 1
#   loop do
#     num_divisors = 0
#     1.upto(starting_num) do |number|
#       num_divisors += 1 if starting_num % number == 0
#     end
#     break if num_divisors == num
#     starting_num += 1
#   end
#   starting_num
# end

# def find_min_num(num)
#   starting_num = 1
#   num_divisors = 0 
#   until num_divisors == num
#     num_divisors = 0
#     1.upto(starting_num) do |number|
#       num_divisors += 1 if starting_num % number == 0
#     end
#     starting_num += 1 unless num_divisors == num
#   end
#   starting_num
# end



p find_min_num(1) == 1
p find_min_num(2) == 2
p find_min_num(3) == 4
p find_min_num(4) == 6
p find_min_num(5) == 16