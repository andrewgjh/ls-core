def count_squares(n)
  (1..n).map{|n| n**2}.sum
end


p count_squares(1) == 1
p count_squares(2) == 5
p count_squares(3) == 14
p count_squares(5) == 55
p count_squares(8) == 204
p count_squares(15) == 1240