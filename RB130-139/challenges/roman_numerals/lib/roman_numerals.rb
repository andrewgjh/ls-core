# class RomanNumeral
#   ONE = "I"
#   FIVE = "V"
#   TEN = "X"
#   FIFTY = "L"
#   HUNDRED = "C"
#   FIVE_HUNDRED = "D"
#   THOUSAND = "M"
#   CHART = {
#     0 => [ONE, FIVE, TEN],
#     1 => [TEN, FIFTY, HUNDRED],
#     2 => [HUNDRED, FIVE_HUNDRED, THOUSAND]
#   }

#   def initialize(int)
#     @number_int = int
#   end

#   def to_roman
#     split_nums = @number_int.digits
#     split_nums.map.with_index do |num, idx|
#       case idx
#       when 0, 1, 2 then convert(num, idx)
#       when 3 then THOUSAND * num
#       end
#     end.reverse.join
#   end

#   def convert(num, place)
#     case num
#     when 0 then ""
#     when 1, 2, 3 then CHART[place][0] * num
#     when 4 then CHART[place][0] + CHART[place][1]
#     when 5 then CHART[place][1]
#     when 6,7,8 then CHART[place][1] + (CHART[place][0] * (num-5))
#     when 9 then CHART[place][0] + CHART[place][2]
#     end
#   end
# end

class RomanNumeral
  attr_accessor :number

  ROMAN_NUMS = {
    "I" => 1,
    "IV" => 4,
    "V" => 5,
    "IX" => 9,
    "X" => 10,
    "XL" => 40,
    "L" => 50,
    "XC" => 90,
    "C" => 100,
    "CD" => 400,
    "D" => 500,
    "CM" => 900,
    "M" => 1000
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    ROMAN_NUMS.values.sort { |a, b| b <=> a }.each do |value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (ROMAN_NUMS.key(value) * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end
