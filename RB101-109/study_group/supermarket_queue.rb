# There is a queue for the self-checkout tills at the supermarket. Your task is write a function to calculate the total time required for all the customers to check out!
# input

#     customers: an array of positive integers representing the queue. Each integer represents a customer, and its value is the amount of time they require to check out.
#     n: a positive integer, the number of checkout tills.

# output

# The function should return an integer, the total time required.
# Important

# Please look at the examples and clarifications below, to ensure you understand the task correctly :)
# Examples

# queue_time([5,3,4], 1)
# # should return 12
# # because when n=1, the total time is just the sum of the times

# queue_time([10,2,3,3], 2)
# # should return 10
# # because here n=2 and the 2nd, 3rd, and 4th people in the 
# # queue finish before the 1st person has finished.

# queue_time([2,3,10], 2)
# # should return 12

=begin

INPUT IS an array representing the time required per customer and integer n represent the amount of tills open
OUTPUT is an integer representing the amount of time lapse to clear the line

ALGO
initialize variable time_lapse and set to 0
initial tills variable and set to array with n elements of arrays 

create a loop
  inner while loop
    while any tills are empty then set that to the next customer in line and customer is not empty
  time_lapse increments by 1
  reassign till to new tills with 1 second less on every till and if set to nil if 
  the loop will break when all of the tills are empty
end

  return tills.max by elemnts array.sum
=end

def queue_time(customers, n)
  tills = Array.new(n, 0)
  time_lapse = 0
  until tills.all? {|till| till == 0} && customers.empty?
    while tills.any? {|till| till == 0} && !customers.empty?
      request_customer = tills.index(0)
      tills[request_customer] = customers.shift
    end
    time_lapse += 1
    tills = tills.map do |till| 
      if till.zero?
        till
      else 
        till - 1
      end
    end
  end
  time_lapse
end



p queue_time([], 1) == 0
p queue_time([5], 1) == 5
p queue_time([2], 5) == 2
p queue_time([1,2,3,4,5], 1) == 15
p queue_time([1,2,3,4,5], 100) == 5
p queue_time([2,2,3,3,4,4], 2) == 9