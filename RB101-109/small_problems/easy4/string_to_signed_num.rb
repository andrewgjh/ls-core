DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_signed_integer(str_int)
  value = 0
  str_int.chars.reverse.each_with_index do |digit, idx|
    if digit == "-"
      value = -value
    elsif DIGITS[digit]
      value += DIGITS[digit] * (10**idx)
    end
  end
  value
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
