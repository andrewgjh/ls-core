=begin
input is a string that should only contain integers and no other characters
output is a boolean to let us know whether the input number is a lucky number
  left sum == right sum

ALGO
  get the chars of the string
  raise error if all characters.ord not between (48..57)
  get the midpoint
  sum left nums and sum right nums and compare if equal
=end


def luck_check(str_int)
  split_string = str_int.chars
  if split_string.any? {|char| !(48..57).include?(char.ord)} ||str_int.empty?
    raise "Incorrect input string"
  end 
  mid = split_string.size / 2
  left = split_string[0,mid].map(&:to_i)
  mid += 1 if split_string.size.odd?
  right = split_string[mid, split_string.size].map(&:to_i)
  left.sum == right.sum
end


p luck_check('683179') == true
p luck_check('56328116') == true
p luck_check('17935') == true
p luck_check('683000') == false
# luck_check('6F43E8')