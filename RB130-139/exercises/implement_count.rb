# frozen_string_literal: true

def count(*args)
  counter = 0
  args.each do |arg|
    counter += 1 if yield(arg)
  end
  counter
end

p count(1, 3, 6, &:odd?) == 2
p count(1, 3, 6, &:even?) == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |_value| true } == 3
p count { |_value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
