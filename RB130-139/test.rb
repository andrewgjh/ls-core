
# def colour
#   ['green', 'blue', "red", "yellow", "purple", "black"].sample
# end
# colour = "green"
# a_proc = proc { |noun| "#{colour} #{noun}" }
 
# def method_enclosure(a_proc)
#   colour = "blue"
#   ["tree", "house", "car"].map(&a_proc)
# end

# p method_enclosure(a_proc)



# def explicit_blocks(&child_block)
#   if block_given?
#     puts "I need to take care of this child_block"
#     child_block.call
#   else
#     puts "I will travel the world"
#   end
# end
# second_child = proc {puts "I need your attention too. "}

# explicit_blocks(&second_child) {puts "Waaaaaaaa! Feed me"}
# puts "----------------"
# explicit_blocks
# colour = 'green'

#  a_proc = proc { |noun| "#{colour} #{noun}" }
#  b_proc = proc { |noun| "#{colour} #{noun}" }
#  c_proc = proc { |noun| "#{colour} #{noun}" }
#  d_proc = proc { |noun| "#{colour} #{noun}" }
#  e_proc = proc { |noun| "#{colour} #{noun}" }
#  f_proc = proc { |noun| "#{colour} #{noun}" }
#  g_proc = proc { |noun| "#{colour} #{noun}" }


# def i_want(*arguments)
#   puts "I'm not using any of the arguments"
# end

# i_want(a_proc, b_proc, c_proc)


# def pizza_store
#   toppings = ["cheese", "sauce", "mushroom", "pepperoni"]
#   Proc.new do |idx|
#     toppings[idx].upcase!
#     p toppings
#   end
# end

# employee = pizza_store
# employee.call(1) # => ["cheese", "chicken", "mushroom", "pepperoni"]
# employee.call(2) # => ["cheese", "chicken", "meatball", "pepperoni"]

# employee2 = pizza_store
# employee2.call(3) # => ["cheese", "sauce", "meatballs", "pepperoni"]


# colour = "green"
# a_proc = proc { |noun| "#{colour} #{noun}" }

# def method_enclosure(a_proc)
#   colour = "blue"
#   ["tree", "house", "car"].map(&a_proc)
# end
# colour = "red"
# p method_enclosure(a_proc)




# actual_proc_class = Proc.new {|*x| p x}

# def my_method(&proc)
#   proc.call(1)
#   proc.call(1,2)
#   proc.call(1,2,3)
#   proc.call(1,2,3,4)
#   proc.call(1,2,3,4,5)
# end

# my_method(&actual_proc_class)


# class ProcClass
#   def to_proc
#     Proc.new {|x| p x + 2}
#   end
# end

# my_proc_class = ProcClass.new
# game = 3

# p [1,2,3].map(&game)



def hello(name)
  "Hello, #{name}"
end

hello_proc = method(:hello).to_proc

p ['Andrew', "Alla", "Arnold"].map(&hello_proc)