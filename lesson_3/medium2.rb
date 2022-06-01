a = "forty two"
b = "forty two"
c = a

puts a.object_id  #unique
puts b.object_id  #unique
puts c.object_id  # same as a

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id


def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

# My string looks like this now: pumpkins
# My array looks like this now: ["pumpkins", "rutabaga"]

#Question 4 
# My string looks like this now: pumpkinsrutabaga
# My array looks like this now: ["pumpkins"]

def not_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  [a_string_param, an_array_param]
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_tricky_method(my_string, my_array)
puts my_string

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


def color_valid(color)
  color == "blue" || color == "green"
end