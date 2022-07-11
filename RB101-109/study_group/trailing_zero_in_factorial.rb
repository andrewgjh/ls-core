def zeros(n)
  power_of = 1
  trailing_zeros = 0
  while 5**power_of < n
    trailing_zeros += n / 5**power_of
    power_of += 1
  end
  trailing_zeros
end


p zeros(0)== 0
p zeros(6)== 1
p zeros(30)== 7