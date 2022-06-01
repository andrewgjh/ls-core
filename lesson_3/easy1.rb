numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# ANSWER : 1,2,2,3


# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

#     what is != and where should you use it?
# when you want to test that two variables/values are not equal to each other
#     put ! before something, like !user_name
# it flips the current boolean value
#     put ! after something, like words.uniq!
# in ruby it means that it is a method that mutates the caller
#     put ? before something

#     put ? after something
# generally it is a method that tests whether something is true or false 
#     put !! before something, like !!user_name
# turn the current variable into a boolean value so true for everything expect nil and false. 


advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!(/important/, 'urgent')



numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)# this deletes the number 2 as it is in position 1 in the array
numbers.delete(1)#this deletes all occurences of the element that is equal to the value 1

# Programmatically determine if 42 lies between 10 and 100.


42.between?(10,100)
(10..100).include?(42)
(10..100).cover?(42)

famous_words = "seven years ago..."
more_famous_words = "Four score and " + famous_words
famous_words.prepend("Four score and ") #mutate caller


flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!


flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.assoc("Barney") #non-mutating
