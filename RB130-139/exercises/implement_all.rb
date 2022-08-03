# frozen_string_literal: true

def all?(arr)
  arr.each { |el| return false unless yield(el) }
  true
end

p all?([1, 3, 5, 6], &:odd?) == false
p all?([1, 3, 5, 7], &:odd?) == true
p all?([2, 4, 6, 8], &:even?) == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |_value| true } == true
p all?([1, 3, 5, 7]) { |_value| false } == false
p all?([]) { |_value| false } == true
