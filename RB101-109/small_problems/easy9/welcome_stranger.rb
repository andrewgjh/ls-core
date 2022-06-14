def greetings(name, stats)
  puts <<-GREETING
  Hello, #{name.join(' ')}! 
  Nice to have a #{stats[:title]} #{stats[:occupation]} around."
  GREETING
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
