def random_age(name="Teddy")
  puts "#{name} is #{rand(20..200)} years old!"
end

puts "What is that person's name?"
name = gets.chomp.strip.capitalize

if name.size > 0
  random_age(name)
else 
  random_age
end

