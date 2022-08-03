# def drop_while(arr)
#   continue = true
#   cutting_idx = 0 
#   arr.each_with_index do |el, idx|
#     continue = false unless yield(el)
#     cutting_idx = idx
#     break unless continue
#     cutting_idx += 1 if idx == arr.size - 1
#   end
#   arr[cutting_idx..]
# end

def drop_while(arr)
  index = 0
  while yield(arr[index]) && index < arr.size
    index += 1
  end 
  arr[index..]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
