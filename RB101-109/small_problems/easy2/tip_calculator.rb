# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

puts "What is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
tip = (gets.chomp.to_f) / 100.0

tip_total = (bill * tip)
total = (bill + tip_total)

puts "The tip is $ #{format('%.2f', tip_total)}"
puts "The total is $ #{format('%.2f', total)}"
