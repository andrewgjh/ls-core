# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

def get_num(place)
  puts "Enter the #{place} number:"
  num = gets.chomp.to_i
end

num_arr = []

%w(1st 2nd 3rd 4rd 5th 6th).each do |num|
  if num == "6th"
    search_num = get_num(num)
    if num_arr.include?(search_num)
      puts "The number #{search_num} appears in #{num_arr}."
    else
      puts "The number #{search_num} does not appear in #{num_arr}."
    end
  else
    num_arr << get_num(num)
  end
end
