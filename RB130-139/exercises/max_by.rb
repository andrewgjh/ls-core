# frozen_string_literal: true

def max_by(arr)
  max_idx = 0
  values_arr = arr.map { |el| yield(el) }
  values_arr.each_with_index do |el, idx|
    max_idx = idx if el > values_arr[max_idx]
  end
  arr[max_idx]
end

def max_by(arr)
  max_idx = 0
  max_yield = yield(arr[0]) unless arr.empty?
  arr.each_with_index do |element, idx|
    yield_value = yield(element)
    if yield_value > max_yield
      max_yield = yield_value
      max_idx = idx
    end
  end
  arr[max_idx]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]], &:size) == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 }.nil?
