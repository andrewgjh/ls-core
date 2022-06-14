
def fizzbuzz(start,stop)
  start.upto(stop) do |num|
    if num % 3 == 0 && num % 5 == 0
      puts "FizzBuzz"  
    elsif num % 3 == 0
      puts "Fizz"
    elsif num % 5 == 0
      puts "Buzz"
    else
      puts num
    end
  end
end

fizzbuzz(1,15)