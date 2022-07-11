require 'prime'

=begin
  INPUTS the first parameter g determines the gap between primes that we are looking for
  m defines the starting value to search from 
  n defines the ending value to search to
  OUTPUT is an array with two elements, indiciating the prime numbers that from this gap
  return nil if there is no such two numbers like this

  ALGO
  initialize prime_set to []
intialize found_gap set to false
  loop from m to n
    check if number is prime
    if yes than push to prime-set
    if there are 2 numbers in prime_set. check difference between last two
      if it equals the gap target then break and set found_gap to true
  return nil or last two numbers depending on wehther found_gap is true or false
=end



def gap(g, m, n)
  prime_set = []
  found_gap = false
  m.upto(n) do |number|
    prime_set.push(number) if number.prime?
    if prime_set.size >= 2
      if prime_set[-1] - prime_set[-2] == g
        found_gap = true
        break
      end
    end
  end
  found_gap ? [prime_set[-2], prime_set[-1]] : nil
end

Prime.each(100) {|num| p num}



# p gap(2,100,110) == [101, 103]
# p gap(4,100,110) == [103, 107]
# p gap(6,100,110) == nil
# p gap(8,300,400) == [359, 367]
# p gap(10,300,400) == [337, 347]
