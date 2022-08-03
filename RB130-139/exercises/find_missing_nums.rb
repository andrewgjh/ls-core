# frozen_string_literal: true

# def missing(int_arr)
#   (int_arr.first..int_arr.last).select do |int|
#     !int_arr.include?(int)
#   end
# end

def missing(int_arr)
  num = int_arr[0]
  missing_nums = []
  until num == int_arr[-1]
    missing_nums << num unless int_arr.include?(num)
    num += 1
  end
  missing_nums
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
