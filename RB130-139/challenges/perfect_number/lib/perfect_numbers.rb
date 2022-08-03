class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 0
    aliquot_sum = divisors(num).sum
    if aliquot_sum == num
      "perfect"
    elsif aliquot_sum < num
      "deficient"
    else
      "abundant"
    end
  end

  private_class_method def self.divisors(number)
    all_divisors = []
    ending = Math.sqrt(number).to_i
    1.upto(ending) do |divisor|
      next unless number % divisor == 0
      all_divisors << divisor
      other_divisor = number / divisor
      all_divisors << other_divisor unless other_divisor == number
    end
    all_divisors
  end
end
