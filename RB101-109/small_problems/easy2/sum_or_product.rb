# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

puts ">> Please enter an integer greater than 0:"
int = nil
loop do
  int = gets.chomp
  break if int.to_i.to_s == int
  puts "Please enter a correct integer."
end
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
action = gets.chomp

int = int.to_i
total = if action == "s"
          (1..int).sum
        elsif action == "p"
          (1..int).reduce(:*)
        end

if action == "s"
  puts "The sum of the integers between 1 and #{int} is #{total}"
elsif action == "p"
  puts "The product of the integers between 1 and #{int} is #{total}"
else
  puts "Unknown Operation"
end
