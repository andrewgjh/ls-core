require "./num_to_str.rb"

def signed_integer_to_string(int)
  if int.negative?
    integer_to_string(int.abs).prepend("-")
  elsif int == 0
    "0"
  else
    integer_to_string(int).prepend("+")
  end
end

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
