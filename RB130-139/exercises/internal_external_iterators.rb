# factorial = Enumerator.new do |yielder|
#   a = 0
#   loop do
#     yielder << 1 if a == 0
#     yielder << (1..a).inject(&:*) if a != 0
#     a += 1
#   end
# end

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  puts 'hello'
  while number < 5
    puts "------"
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

p factorial.take(7) # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

# factorial.each_with_index do |value, number|
#   puts "#{number}! == #{value}"
#   break if number >= 5
# end

# 6.times { |number| puts "#{number}! == #{factorial.next}" }
# puts "=========================="
# 6.times { |number| puts "#{number}! == #{factorial.next}" }
# puts "=========================="
# factorial.rewind
# 6.times { |number| puts "#{number}! == #{factorial.next}" }
# puts "=========================="

# Internal iterators

# factorial.each_with_index do |value, number|
#   puts "#{number}! == #{value}"
#   break if number > 100
# end
