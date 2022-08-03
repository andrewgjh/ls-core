# # # Group 1
# my_proc = proc { |thing, second_thing| puts "This is a #{thing} and #{second_thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')
# james = "james"
# Group 2
# my_lambda = lambda { |thing| puts "This is a #{james}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

def method_123
  andrew = 31
  action = ->(age) { puts "Andrew is #{age || andrew}." }
  2.times { action.call(nil) }
  action
end

returned_action = method_123

1.times { returned_action.call(nil) }

# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}
