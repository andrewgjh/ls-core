# class MyCar
#   attr_accessor :color
#   attr_reader :year, :model
#   def initialize(year, color, make, model)
#     @year = year
#     @color = color
#     @make = make
#     @model = model
#     @speed = 0
#   end

#   def self.gas_milage(gallons, miles)
#     puts "#{miles / gallons} miles per gallon of gas"
#   end

#   def speed_up(number)
#     @speed += number
#   end

#   def brake(number)
#     @speed -= number
#   end

#   def shut_off
#     @speed = 0
#   end

#   def spray_paint(color)
#     self.color = color
#   end

#   def to_s
#     "This is my #{color} #{model}."
#   end
# end

# honda_fit = MyCar.new("2015", "white", "Honda","Fit")
module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

# pingu = Penguin.new
# pingu.fly

# p Penguin.ancestors

class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

# daisy = Cow.new("Daisy")
# daisy.speak

# class Person
#   attr_accessor :name
# end

# class Person
#   def name
#     @name
#   end

#   def name=(name)
#     @name = name
#   end
# end

# kate = Person.new
# kate.name = 'Kate'
# p kate.name # => 'Kate'

# class Person
#   attr_writer :first_name, :last_name

#   def full_name
#     "#{first_name} #{last_name}"

#   end
# end

# mike = Person.new
# mike.first_name = 'Michael'
# mike.last_name = 'Garcia'
# p mike.full_name # => 'Michael Garcia'

# class Student
#   attr_accessor :name, :grade

#   def initialize(name)
#     @name = name
#     @grade = nil
#   end

#   def change_grade(new_grade)
#   grade = new_grade
# end

# end

# priya = Student.new("Priya")
# priya.change_grade('A')
# p priya.grade # => "A"

class TestClass
  p self
  def self.gallon
    puts self
  end
end

# TestClass.gallon
