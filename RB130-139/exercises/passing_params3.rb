items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*vegetables, wheat|
  puts vegetables.join(", ")
  puts wheat
end

gather(items) do |apples, *staples, wheat|
  puts apples
  puts staples.join(", ")
  puts wheat
end

gather(items) do |apples, *everything_else|
  puts apples
  puts everything_else.join(", ")
end

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, #{wheat}"
end
