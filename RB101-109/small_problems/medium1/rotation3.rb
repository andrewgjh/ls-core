=begin
split into array of str chars

loop through each element in array and slice from that position until the end and reassign in place to the rotated version of that and continue until you are at the last index

=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def max_rotation(int)
  all_digits = int.digits.reverse
  all_digits.each_with_index do |num, idx|
    all_digits[idx..-1] = rotate_array(all_digits[idx..-1])
  end
  all_digits.join.to_i
end


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845