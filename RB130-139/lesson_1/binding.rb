# def call_me(some_code)
#   some_code.call
# end

# name = "Robert"
# chunk_of_code = Proc.new {puts "hi #{name}"}
# # name = "Griffin III"        # re-assign name after Proc initialization

# call_me(chunk_of_code)

# def welcome(str)
#   p block_given?
# end

# welcome('Hello') # => Hello there
# # welcome('Hey') { 'Joe' } # => Hey Joe

# def true_or_false(&block)
#   puts "The block is #{block.call}"
# end

# true_or_false { 5 > 8 }

# def call_chunk(code_chunk)
#   code_chunk.call
# end

# color = "blue"
# say_color = Proc.new {puts "The color is #{color}"}
# call_chunk(say_color)

# p [2, 3, 5].inject(1, &:+)

ARRAY = [1, 2, 3]

def abc
  a = 3
end

def xyz(collection)
  collection.map { |x| yield x }
end

xyz(ARRAY) do
  p xyz([1, 2, 3])
end
