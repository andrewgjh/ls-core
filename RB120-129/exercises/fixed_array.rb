class FixedArray
  attr_reader :max_index

  def initialize(num)
    @fixed_arr = Array.new(num)
    @max_index = num - 1
  end

  def [](idx)
    raise IndexError unless valid_idx?(idx)
    @fixed_arr[idx]
  end

  def []=(idx, new_value)
    raise IndexError unless valid_idx?(idx)
    @fixed_arr[idx] = new_value
  end

  def to_a
    @fixed_arr.clone
  end

  def to_s
    @fixed_arr.to_s
  end

  private 
  def valid_idx?(num)
    if num.negative?
      num.abs <= max_index + 1
    else
      num <= max_index
    end
  end

end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end