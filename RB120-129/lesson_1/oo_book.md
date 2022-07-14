## The Object Model

1. How do we create an object in Ruby? Give an example of the creation of an object.

- Objects are created by calling `.new` on a class. For Example `Array.new` or `Hash.new`
- If it is your own created class such as Plant you would call `Plant.new`

```ruby
  class Plant

  end
  leafy = Plant.new()
```

2. What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

``

- module is a way to store methods or other classes
- when storing methods it is to extending method functionability between different classes
- when storing classes, it's purpose is to create namespacing so that related classes are kept neatly in a module

```ruby
module Grow
  def grow(height)
    height += 1
  end
end

class Plant
  include Grow
end

class Tree
  include Grow
end

module Transportation

  class Bicycle

  end

  class Bus

  end
end

my_bus = Transportation::Bus.new()
```

## Classes and Objects I

1. Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

2. Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

3. You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.

```ruby
class MyCar
  attr_accessor :color
  attr_reader :year
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(number)
    @speed += number
  end

  def brake(number)
    @speed -= number
  end

  def shut_off
    @speed = 0
  end

  def spray_paint(color)
    self.color = color
  end
end
```

## Classes and Objects II

1. Add a class method to your MyCar class that calculates the gas mileage of any car.

```ruby
class MyCar
  attr_accessor :color
  attr_reader :year
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def self.gas_milage

  end

  def speed_up(number)
    @speed += number
  end

  def brake(number)
    @speed -= number
  end

  def shut_off
    @speed = 0
  end

  def spray_paint(color)
    self.color = color
  end

  def to_s
    "This is my #{color} #{model}."
  end
end
```

2. Override the to_s method to create a user friendly print out of your object.
   Solution

When running the following code...

```ruby
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
```

We get the following error...

```
test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
```

Why do we get this error and how do we fix it?
