=begin

input is two integers, first is the base of the number and second is the pow 
output is a single integer represent the last digit of the result

algo
return 1 if pow is 0 
set last_digit to base
pow - 1 times loop 
  last_digit = (last_digit * base).digits[0]

return last_digit

=end


# def last_digit(base, pow)
#   return 1 if pow.zero?
#   last_digit = base
#   (pow - 1).times do
#     last_digit = (last_digit* base).digits[0]
#   end
#   last_digit
# end

def last_digit(base, pow)
  return 1 if pow.zero?
  reduced_base = base.digits[0]
  recuced_pow = pow % 4 == 0 ? 4 : pow % 4
  (reduced_base ** recuced_pow).digits[0]
end


p last_digit(4, 1) == 4
p last_digit(4, 2) == 6
p last_digit(9, 7) == 9
p last_digit(10, 10 ** 10) == 0
p last_digit(2 ** 200, 2 ** 300) == 6
p last_digit(3715290469715693021198967285016729344580685479654510946723, 68819615221552997273737174557165657483427362207517952651) == 7


# last_digit(4, 1)                # returns 4
# last_digit(4, 2)                # returns 6
# last_digit(9, 7)                # returns 9
# last_digit(10, 10 ** 10)        # returns 0
# last_digit(2 ** 200, 2 ** 300)  # returns 6
