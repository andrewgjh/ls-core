=begin
You are going to be given an array of integers, Your job is to take that array and find an index N where the sum of the integers to the left of the N is equal to sum of the integers to the right of N. If you is no index that would make this happen return -1

INPUT is an array of integers with both positive and negative numbers

OUTPUT is an integer presenting the index in the array where sum of left side values is equal to sum of right side values

ALGO
initialize value index_balancer and set to -1
iterate through all the elements of the array and test by adding the elements to the left of it with teh elements to the right of it
  if it evaluates to true for equality then change index_balancer to the current index of iteration

return the index_balancer
=end


def find_even_rrrindex(int_arr)
  index_balancer = int_arr.empty? ? 0 : -1
  int_arr.each_with_index do |_, idx| 
    left = int_arr[0,idx].sum
    right = int_arr[idx+1,int_arr.size].sum
    index_balancer = idx if left == right
  end
  index_balancer
end


p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index([])