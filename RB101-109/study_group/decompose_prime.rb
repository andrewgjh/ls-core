require 'prime'

=begin
input is a integer greater than 1
output is a string that represent all the prime numbers and powers required to get the input number

algo
initialize a prime_hash and set default to 0
Prime.each(up to n)
inner loop -- input n modulo the current iterations prime number is 0 
  prime_hash[prime_number] +=1
  n = n / prime_number
break if n == 0


=end


# def prime_factors(n)
#   prime_hash = Hash.new(0)
#   Prime.each(n) do |prime_num|
#     while n % prime_num == 0
#       prime_hash[prime_num] += 1
#       n = n / prime_num
#     end
#     break if n == 0
#   end
#   prime_hash.map{|k,v|"(#{k}#{v ==1 ? "": "**"}#{v ==1 ? "": v})"}.join
# end


def prime_factors(n) 
  ws = [1,2,2,4,2,4,2,4,6,2,6]
  f = 2
  w = 0
  primes_hash = Hash.new(0)

  while (f * f <= n) 
    if (n % f == 0) 
      primes_hash[f] += 1
      n /= f
    else 
      f += ws[w]
      w = (w == 10) ? 3 : ( w+1 )
    end
  end
  primes_hash[n] += 1
  primes_hash.map{|k,v|"(#{k}#{v ==1 ? "": "**"}#{v ==1 ? "": v})"}.join
end




# p prime_factors(7775460) == "(2**2)(3**3)(5)(7)(11**2)(17)"
p prime_factors(7775460) == "(2**2)(3**3)(5)(7)(11**2)(17)"
# p prime_factors(8051) #== "(2**2)(3**3)(5)(7)(11**2)(17)"
# p wheel(10403) #== "(2**2)(3**3)(5)(7)(11**2)(17)"
# p rho(2147483742,1) #== "(2**2)(3**3)(5)(7)(11**2)(17)"