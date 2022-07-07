def triangle(*angles)
  valid_condition_1 = angles.any? {|angle| angle <= 0}
  valid_condition_2 = angles.sum != 180
  return :invalid if valid_condition_1 || valid_condition_2

  if angles.include?(90) 
    :right
  elsif angles.all? {|angle| angle < 90} 
    :acute
  else 
    :obtuse 
  end
end


p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid