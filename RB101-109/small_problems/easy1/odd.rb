# Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.


def is_odd1?(int)
  int % 2 != 0
end
def is_odd?(int)
  int.remainder(2) != 0
end



puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true


#  modulo 	            remainder
#  5 mod 2 == 1 	     5 rem 2 == 1
# -5 mod 2 == 1 	    -5 rem 2 == -1
#  5 mod -2 == -1      5 rem -2 == 1
# -5 mod -2 == -1 	  -5 rem -2 == -1

# If you weren't certain whether % were the modulo or remainder operator, how would you rewrite #is_odd? so it worked regardless?

# The Integer#remainder method performs a remainder operation in Ruby. Rewrite #is_odd? to use Integer#remainder instead of %. Note: before version 2.4, Ruby used the Numeric#remainder method instead.