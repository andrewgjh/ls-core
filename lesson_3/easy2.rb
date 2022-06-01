ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.include?("Spot")
ages.has_key?("Spot") # alias for include 
ages.member?("Spot") # alias for include

munsters_description = "The Munsters are creepy in a good way."

# ADD ! to mutate caller
munsters_description.swapcase
munsters_description.capitalize
munsters_description.downcase
munsters_description.upcase

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

advice = "Few things in life are as important as house training your pet dinosaur."

advice.match?(/Dino/)

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones << "Dino"
# flintstones.concat(["Dino", "Hoppy"])
# flintstones.push("Dino", "Hoppy")

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!(0,advice.index('house'))

statement = "The Flintstones Rock!"
statement.count("t")

title = "Flintstone Family Members"
title.center(40)