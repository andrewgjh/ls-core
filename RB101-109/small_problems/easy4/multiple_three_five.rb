# Write a method that searches for all multiples of 3 or 5 that lie between 1
# and some other number and then computes the sum of those multiples.
# For instance, if the supplied number is 20,
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
# You may assume that the number passed in is an integer greater than 1.

# def multisum(num)
#   multiples = []
#   1.upto(num) do |n|
#     puts n
#     if n % 3 == 0 || n % 5 == 0
#       multiples << n
#     end
#   end
#   multiples.sum
# end

def multisum(num)
  multiples = []
  counter = 1
  while 5 * counter <= num
    multiples << counter * 5
    counter += 1
  end
  counter = 1
  while 3 * counter <= num
    multiple_three = counter * 3
    multiples << multiple_three unless multiples.include?(multiple_three)
    counter += 1
  end
  multiples.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
