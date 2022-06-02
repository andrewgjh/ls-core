flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = flintstones.map.with_index { |k, v| [k, v] }.to_h

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

added_ages = ages.values.sum
ages.values.inject(:+)

total_ages = 0
ages.each { |_, age| total_ages += age }
total_ages # => 6174

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

young_ages = ages.select { |_k, v| v < 100 }

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

youngest = ages.min_by { |_, v| v }

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index { |flintstone| flintstone.start_with?("Be") }

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map { |el| el[0, 3] }

statement = "The Flintstones Rock"

occurence_hash = {}
statement.clone.delete(" ").each_char do |char|
  if occurence_hash[char]
    occurence_hash[char] += 1
  else
    occurence_hash[char] = 1
  end
end

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end

words = "the flintstones rock"

p words.split.map!(&:capitalize).join(" ")

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

# munsters.each do |k,v|
#   if v["age"] > 65
#     munsters[k]["age_group"] = "senior"
#   elsif v["age"] <= 64 && v["age"] >= 18
#     munsters[k]["age_group"] = "adult"
#   else
#     munsters[k]["age_group"] = "kid"
#   end
# end

munsters.each do |name, stats|
  case stats["age"]
  when (0...18)
    munsters[name]["age_group"] = "kid"
  when (18..64)
    munsters[name]["age_group"] = "adult"
  else
    munsters[name]["age_group"] = "senior"
  end
end

p munsters
