def sequence(int)
  return -1 if int.negative?
  (1..int).to_a 
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-100) == -1
