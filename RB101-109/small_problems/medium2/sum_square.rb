def sum_square_difference(num)
  sum_then_squared = (1..num).sum**2
  squared_then_sum = (1..num).reduce { |mem, num| num**2 + mem }
  sum_then_squared - squared_then_sum
end

p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
