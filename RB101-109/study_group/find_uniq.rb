
# def find_uniq(arr)
#   arr.detect {|n| arr.count(n) == 1}
# end

def find_uniq(int_arr)
  grouped = int_arr.group_by {|num| num}
  grouped.find {|_,v| v.size == 1}.first
end


p find_uniq([1,1,1,1,0]) == 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55