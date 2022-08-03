class Octal
  def initialize(octal)
    @octal_num = octal
  end

  def to_decimal
    return 0 unless valid?
    reverse_digits_arr.map.with_index do |digit, idx|
      digit.to_i * 8**idx
    end.sum
  end

  private

  def valid?
    reverse_digits_arr.all? { |char| ("0".."7").member?(char) }
  end

  def reverse_digits_arr
    @octal_num.chars.reverse
  end
end
