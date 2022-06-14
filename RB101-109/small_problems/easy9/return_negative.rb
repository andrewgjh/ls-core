def negative(int)
  int.negative? ? int : -int
end


p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0  