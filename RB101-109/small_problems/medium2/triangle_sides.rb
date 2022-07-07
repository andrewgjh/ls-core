def triangle(*sides)
  sides.sort!
  valid_condition_1 = sides.any? {|side| side <= 0}
  valid_condition_2 = (sides[0] + sides[1]) <= sides[2]
  return :invalid if valid_condition_1 || valid_condition_2
  case sides.uniq.size
  when 1 then :equilateral  
  when 2 then :isosceles
  when 3 then :scalene
  end
end


p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
p triangle(10,7,7) 
