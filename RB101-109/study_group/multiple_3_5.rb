=begin

INPUT is a integer 
OUTPUT is an integer return 0 if input number is negative

ALGO

get the range between 0 and the inputed num 
use select method to pick numbers that when % 3 or % 5 will return 0 

return the sum of the returned select array

=end


def solution(upper_limit)
  (1...upper_limit).select do |num|
    num % 3 == 0 || num % 5 == 0
  end.sum
end


p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168