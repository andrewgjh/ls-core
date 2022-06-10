DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}


def string_to_integer(str_int)
  final_num = 0
  digit_place = 1
  num_arr = str_int.chars
  num_arr.reverse.each do |digit|
    digit_int = DIGITS[digit]
    final_num += digit_int * digit_place 
    digit_place *= 10
  end
  final_num
end


# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char] }

#   value = 0
#   digits.each { |digit| value = 10 * value + digit }
#   value
# end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570