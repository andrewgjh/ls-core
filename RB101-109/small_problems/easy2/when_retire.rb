# Build a program that displays when the user will retire and how many years she has to work till retirement.


puts "What is your age?"
age = gets.chomp.to_i
puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

to_work = retire_age - age
current_year = Time.now.year
retire_year = current_year + to_work

puts "It's #{current_year}. You will retire in #{retire_year}."
puts "You have only #{to_work} years of work to go!"

