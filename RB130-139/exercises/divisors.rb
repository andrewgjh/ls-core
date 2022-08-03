# frozen_string_literal: true

# def divisors(pos_int)
#   (1..pos_int).select {|num| pos_int % num == 0}
# end

def divisors(number)
  all_divisors = []
  ending = Math.sqrt(number).to_i
  1.upto(ending) do |divisor|
    next unless number % divisor == 0

    all_divisors << divisor
    other_divisor = number / divisor
    all_divisors << other_divisor
  end
  all_divisors.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99_400_891) == [1, 9967, 9973, 99_400_891] # may take a minute
p divisors(999_962_000_357)
