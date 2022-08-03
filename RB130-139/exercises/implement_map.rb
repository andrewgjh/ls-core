# frozen_string_literal: true

def map(arr)
  transformed_arr = []
  arr.each do |el|
    transformed_arr << yield(el)
  end
  transformed_arr
end

def map(arr)
  collection_class = arr.class
  arr.inject(collection_class.new) do |acc, cur|
    if collection_class == Array
      acc << yield(cur)
    elsif collection_class == Hash
      k, v = yield(cur)
      acc.merge!(k => v)
    end
  end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |_value| true } == []
p map(%w(a b c d)) { |_value| false } == [false, false, false, false]
p map(%w(a b c d), &:upcase) == %w(A B C D)
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

p map({ a: 1, b: 2 }) { |k, v| [(k.to_s + 'andrew').to_sym, v + 2] }
