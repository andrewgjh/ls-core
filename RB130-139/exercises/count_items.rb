# frozen_string_literal: true

# def count(collection)
#   counter = 0
#   collection.each do |el|
#     counter += 1 if yield(el)
#   end
#   counter
# end

# def count(collection)
#   counter = 0
#   for element in collection
#     counter += 1 if yield(element)
#   end
#   counter
# end

def count(collection)
  counter = 0
  0.upto(collection.size - 1) do |idx|
    counter += 1 if yield (collection[idx])
  end
  counter
end

p count([1, 2, 3, 4, 5], &:odd?) == 3
# p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# p count([1,2,3,4,5]) { |value| true } == 5
# p count([1,2,3,4,5]) { |value| false } == 0
# p count([]) { |value| value.even? } == 0
# p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
