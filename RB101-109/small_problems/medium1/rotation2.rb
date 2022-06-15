
# def rotate_rightmost_digits(int, num_digits_right)
#   digits_arr = int.digits
#   num = digits_arr.delete_at(num_digits_right - 1)
#   digits_arr.unshift(num)
#   digits_arr.reverse.join.to_i
# end

def rotate_rightmost_digits(int, num_digits_right)
  digits_arr = int.to_s.chars
  num = digits_arr.delete_at(-num_digits_right)
  digits_arr.push(num)
  digits_arr.join.to_i
end


def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(int, num_digits_right)
  num_arr = int.to_s.chars
  start = num_arr[0...-num_digits_right] 
  rotated = rotate_array(num_arr[-num_digits_right..-1])
  (start + rotated).join.to_i
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
