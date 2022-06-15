def fibonacci(num)
  fib_arr = [1,1]
  3.upto(num) do |i|
    fib_arr << fib_arr[-1] + fib_arr[-2]
  end
  fib_arr[-1]
end

# p fibonacci 100001