module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  @@total = 0
  include Walkable

  attr_accessor :name

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def self.total
    puts @@total
  end

  def initialize(name)
    @name = name
    @@total += 1
  end

  def greet
    puts "Hello my name is #{name}!"
  end

  def rename(n)
    self.name = n
  end

  def identify
    self
  end

  def to_s
    "I'm #{name}!"
  end
end

# kitty = Cat.new("Sophie")
# kitty.greet
# kitty.name = "Luna"
# kitty.greet
# kitty.walk
# # Cat.generic_greeting
# kitty.class.generic_greeting

kitty = Cat.new('Sophie')
# p kitty.name
# kitty.rename('Chloe')
# p kitty.name
# p kitty.identify

# kitty1 = Cat.new("k1")
# kitty2 = Cat.new("k2")
# Cat.total
puts kitty
