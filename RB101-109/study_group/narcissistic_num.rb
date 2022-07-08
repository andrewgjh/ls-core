# A Narcissistic Number is a positive number which is the sum of its own digits, each raised to the power of the number of digits in a given base. In this Kata, we will restrict ourselves to decimal (base 10).


# The Challenge:

# Your code must return true or false (not 'true' and 'false') depending upon whether the given number is a Narcissistic number in base 10. This may be True and False in your language, e.g. PHP.

# Error checking for text strings or other invalid inputs is not required, only valid positive non-zero integers will be passed into the function. 

=begin

INPUT is a non-zero positive integer 
OUTPUT is a boolean representing whether the input integer is a narcissitic number

ALGO
call digits on the input integer 
call map on the digits array and transform each element by the power of the digits array size and then call sum

check whether input is equal to the result and return as boolean

=end


def narcissistic?(value)
  digits_arr = value.digits
  result_num = digits_arr.map {|num| num ** digits_arr.size }.sum
  result_num == value
end




p narcissistic?(5) == true
p narcissistic?( 153 ) == true
p narcissistic?( 1633 ) == false