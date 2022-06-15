def rotate_array(arr)
  arr_copy = arr.dup
  arr_copy << arr_copy.shift
  arr_copy
end

def rotate_array(array)
  array[1..-1] + [array[0]]
end


def rotate_string(text)
  rotate_array(text.chars).join
end

def rotate_num(int)
  rotate_array(int.digits).join.to_i
end



p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true



p rotate_string("Andrew")
p rotate_num(123)