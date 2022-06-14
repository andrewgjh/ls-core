SQMETERS_TO_SQFEET = 10.7639

# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

puts "Please enter the length of the room in meters"
length = gets.chomp.to_f
puts "Please enter the width of the room in meters"
width = gets.chomp.to_f

square_meters = (length * width).round(2)
square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{square_meters} square meters (#{square_feet} square feet)."
