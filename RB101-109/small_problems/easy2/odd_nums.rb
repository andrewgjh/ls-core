# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

puts (1..99).select {|n| n.odd?} 

value = 1
while value <= 99
  puts value
  value += 2
end