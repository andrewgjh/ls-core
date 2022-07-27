- [ ] Reading OO code

```ruby
class Student
  attr_reader :id

  def initialize(name)
    @name = name
    @id
  end

  def id=(value)
    self.id = value
  end
end

tom = Student.new("Tom")
tom.id = 45
```

- line 4 to 15 is a definition of `Student` class with two methods

  1. an `initialize` method is defined, accepting one parameter name and setting it to the instances variable `@name` and then it returns an uninitialized instance variable `@id` which would evaluate to `nil` and subsequently ignored by the `.new` class method that called initialize
  2. the second method is a setter method for the instance variable `@id`
     the the method accepts a single parameter `value` and within the method, it makes a recursive call to itself and passes the `value` parameter into itself. this would cause an infinite loop

- on line 17 an instance object of class Student is instantiated and passed a string object with value `"Tom"` as an argument
- this object is then saved to a variable `tom`
- on line 18 the student object stored in the `tom` variable calls the instance setter method for `@id` and pass `45` as an argument
  - this causes the infinite loop described where the setter id continiously calls itself

---

2. Define a class of your choice with the following:

   Constructor method that initializes 2 instance variables.
   Instance method that outputs an interpolated string of those variables.
   Getter methods for both (you can use the shorthand notation if you want).
   Prevent instances from accessing these methods outside of the class.
   Finally, explain what concept(s) you’ve just demonstrated with your code.

```ruby
class Carpet

attr_reader :origin, :colour

  def initialize(origin, colour)
    @origin = origin
    @colour = colour
  end

  private
  def describe_it
    puts "My carpet is from #{origin} and it is #{colour}."
  end
end

my_carpet = Carpet.new("Persia", "white and blue")
```

---

#3 — What concept does the following code aim to demonstrate?

```ruby
module Greet
  def greet(message)
    puts message
  end
end

class Teacher
  include Greet
end

class Student
  include Greet
end

tom = Teacher.new
rob = Student.new

tom.greet "Bonjour!"
rob.greet "Hello!"
```

- this code demonstrates interface inheritance whereby behaviours(methods) are stored in a `module` and including in classes that should hold these behaviours
- it is important to use modules in this scenario because inheritance does not portray the relationship between `Teacher` and `Student` classes and therefore and therefore they are instead mixed in with a module
- this is ultimately to maintain non-repetitive readable code

---

#4 — What will the last line of code return?

```ruby
class Student
  def initialize(id, name)
    @id = id
    @name = name
  end

  def ==(other)
    self.id == other.id
  end

  private

  attr_reader :id, :name
end

rob = Student.new(123, "Rob")
tom = Student.new(456, "Tom")

rob == tom
```

- a `Student` class is defined from line 90 to 103
- its constructor method (initialize) accepts two parameters which are used to create instance variables @id and @name on a student instance
- then there is a instance method override for `==` method which will compare the instance variable id to the return value of calling `.id` on the object that was passed in
- finally getter methods are created for the instance variables @id and @name and set to private which means only the instance methods of that class can call that method
- ultimately this code will raise an exception on line 108 due to the fact that we try to call the `.id` method (which is a private) on `tom` when running the `==` method
- the way to fix this exception is simply to change the
  access to `protected` instead of `private` for the `attr_reader` so that other objects of the same class are able to call the getter method but still provides a hidden interface so the outside cannot access the variables @id and @name

---

#5 — What will the last 2 lines of code output?

```ruby
class Foo
  def self.method_a
    "Justice" + all
  end

  def self.method_b(other)
    "Justice" + other.exclamate
  end

  private

  def self.all
    " for all"
  end

  def self.exclamate
    all + "!!!"
  end
end

foo = Foo.new
puts Foo.method_a
puts Foo.method_b(Foo)
```

- the class `Foo` is defined from line 130 to 148 and has four class methods defined
- two of which are `private` methods that can only be called by the class itself
  - the `::all` method will return a String `" for all"`
  - the `::exclamate` methdo will call the `::all` method and concatenate `"!!!"` to its return value
- the other two are public class methods
  - `::method_a` class method which will concentenate the string `"Justice"` with the return value from calling the private `::all` method
  - `::method_b` class method will concentenate the string `"Justice"` with calling the `.exclamate` method from the passed in argument object
- on line 150 an instance of the class `Foo` is created and pointed to by an initialized moethod `foo`
- line 151 will pass the return value from calling the class method `::method_a` from the `Foo` class to the `puts` method
  - the output to the screen should be `"Justice for all"`
- on line 152 the class method `::method_b` is called from the class `Foo` and it accepts an argument and the class `Foo` is passed in

  - the class method `::exclamate` is called and returns the string `" for all!!!"` which is concatenated to `"Justice"` and returned and passed as an argument to the `puts` method and outputed to the screen as `Justice for all!!!`
  - the keyword `private` has no effect on the class methods and in order to create private class methods
  - you need to use the method `private_class_method` in front of the method you are defining

---

```ruby
class Person
 attr_reader :name

 def initialize(name)
   @name = name
 end

 def greet
    "Hello! they call me #{name}"
 end
end

class Puppet < Person
 def initialize(name)
   super
 end

 def greet(message)
   puts super + message
 end
end

puppet = Puppet.new("Cookie Monster")
puppet.greet(" and I love cookies!")
```

- on line 174 to 184 a class `Person` is defined with a constructor method and an instance method greet
- as well as the creation of the getter method for `@name` instance variable

  - the constructor method sets the input parameter `name` to a newly created instance variable `@name`
  - the `greet` method returns a string with string interpolation from the return value of calling the getter method `name`

- on line 186 to 194 a class `Puppet` is defined which subclasses the `Person` class
  - its own constructor method simply calls `super` passing all arguments to `Person#initialize`
  - the `Puppet` class also has a greet method which calls super and passes all its arguments to `Person#greet`
  - it then trys to concatenate the input argument `message` to the return value from super and pass it to `puts` method to be outputted to the screen
  - this should raise an exception on line 197 because `Person#greet` does not accept any arguments and therefore when the argument `message` is passed by `Puppet#greet` it will say that it got 1 argument but expected 0
  -

---

#7 — What concept does this code demonstrate? What will be the output?

```ruby
class Bird
  def fly
    p "#{self.class} is flying!"
  end
end

class Pigeon < Bird; end
class Duck < Bird; end

birds = [Bird.new, Pigeon.new, Duck.new].each(&:fly)
p birds
```

- this code example demonstrates the concept of polymorphism and more specifically duck typing
  - as each class `Bird` `Pigeon` and `Duck` each have a `fly` method which outputs a different message when called
  - this demonstrates the ability to call the same `fly` method without being concerned with the implementation details
  - and duck typing takes place on line 227 when the `each` method calls the `fly` method on each of its elements
  - this show us that we aren't concerned with what element is passed to each iteration as long as it is an object that contains a fly method, the code will run as expected
  - therefore the code will output `Bird is flying!`, `Pigeon is flying!` and finally `Duck is flying`
  - the variable `bird` on line 227 will however store the return value of `.each` which will in this case be the array of bird, pigeon and duck objects

---

#8 — What does the self keyword refer to in the good method?

```ruby
class Dog
  attr_accessor :name

  def good
    self.name + " is a good dog"
  end
end

bandit = Dog.new
bandit.name = "Bandit"
p bandit.good
```

- self within the `good` method refers to the instance object of the class `Dog` that is being pointed to by the variable `bandit`
- the `Dog` class is defined from line 244 to 250

  - it establishes getter and setter methods for the instance variable `@name`
    - the `good` method, calls the getter method `name`(appending `self` unnecessarily)
      - it then takes the return value value the `name` method and concatenates a string `" is a good dog"`

- on line 252 the `bandit` variable is initialized and set to a new instantiation of the `Dog` class
- line 253 calls the setter method `name=` on the dog instance and passes in the argument `"Bandit"`
  - this sets the instance variable `@name` to point to the String object with value `Bandit`
- then on line 254, the `good` method is called on the dog instance
  - within the method the name getter returns the string `"Bandit"` and concatenates it to the string `" is a good dog"` and returns the new string
- the return value is passed to the `p` method and outputted to the screen

---

#9 — What will the last three lines of code print to the console? After song.artist is called, what would be returned if we inspect the song object?

```ruby
class Song
  attr_reader :title, :artist

  def initialize(title)
    @title = title
    @artist
  end

  def artist=(name)
    @artist = name.upcase
  end
end

p song = Song.new("Superstition")
p song.artist = "Stevie Wonder"
p song.artist
```

- on line 289 the song object will output a string that represents the `Song` object with an object id and instance variable `@title` set to `Supersition`
- on line 290 the setter method for the `@artist` instance variable is called and passed the argument `Stevie Wonder`, it will output to the screen `Stevie Wonder` with no upcasing (this is because setter methods return whatever is passed in as an argument)
- on line 291 the getter method is called on the instance variable `@artist` which will return `"STEVIE WONDER"` which will be returned and passed to the `p` method and outputted on the screen

---

#10 — What will the last 2 lines output in this case?

```ruby
class Song
  attr_reader :title, :artist

  def initialize(title)
    @title = title
  end

  def artist=(name)
    @artist = name
    name.upcase!
  end
end

song = Song.new("Superstition")
p song.artist = "Stevie Wonder"
p song.artist
```

- line 317 and 318 will output `STEVIE WONDER` because the object passed as an argument to the setter method `artist=` was mutated and changed in place to its upcased version
- since the setter method simply returns the argument that was passed it, the argument that was passed in has now been mutated and will be returned in its upcase form
- and obviously since the instance variable `@artist` also points to the same object that was passed in as an argument in the setter method
  it will also return the upcased version `STEVIE WONDER`

---

#11 — What would cat.name return after the last line of code is executed?

```ruby
class Cat
  attr_accessor :name

  def set_name
    name = "Cheetos"
  end
end

cat = Cat.new
cat.set_name
p cat.name
```

- the `Cat` class is defined from line 331 to 337
  - it creates the getter and setter methods for the instance variable `@name`
  - a method `set_name` is defined in which it sets a local variable `name` to the string object with value `"Cheetos"`
    - which will be returned by the set_name method
  - on line 339 an instance of the class `Cat` is created and assigned to the variable `cat`
  - the `set_name` method is called on the `cat` instance
- the `@name` instance variable at this point is still uninitialized and therefore would return `nil` if the getter method was on it is

---

#12 — What will the last two lines of code output?

```ruby
STR = "Flying"
module Walk
  STR = "Walking"
end

module Run
  STR = "Running"
end

module Jump
  STR = "Jumping"
end

class Bunny
  include Jump
  include Walk
  include Run
end

class Bugs < Bunny; end

p Bugs.ancestors
p Bugs::STR

```

- the following code contains three modules `Walk` `Run` and `Jump` which each define a constant `STR` and sets it to the a different string
- class `Bunny` is defined and mixes in all three modules
- class `Bugs` is defined and subclasses the `Bunny` class
- on line 377 the method `.ancestors` is called on the `Bugs` class
  - it will return the following array`[Bugs, Bunny, Run, Walk, Jump, Object, Kernel, BasicObject]` which will be passed to the `p` method and outputed to the screen
- on line 378 when it looks for the constant `STR` it will search first lexically and then move up the `.ancestors` path and find it in the module `Run` the string `Running` will be evaluated and passed to the `p` method and outputed to the screen

---

#13 — What will be returned by the value1 and value2 method calls?

```ruby
VAL = 'Global'

module Foo
  VAL = 'Local'

  class Bar
    def value1
      VAL
    end
  end
end

class Foo::Bar
  def value2
    VAL
  end
end

p Foo::Bar.new.value1
p Foo::Bar.new.value2
```

- a global constant `VAL` is set to the string `'Global'`
- within the module `Foo`
  - another constant `VAL` is initialized and set to the string `"Local"`
  - as well as a class definition `Bar` that has a method `value1` which return the constant `VAL`
- outside of the module we reference the same class `Bar` namespaced inside the module `Foo` and define another method
  - `value2` which also also returns the constant `VAL`
- as the methods are called, the constant `VAL` is resolved lexically, starting the search from where they are required
- since `value1` method is defined inside the class definition `Bar` that is sits inside the module `Foo` with a constant `VAL`, it will return `"Local"`
- whereas `value2` method is defined within the class `Foo::Bar` which is sitting in the global scope and therefore it will look outwards until it finds the constant `VAL` in the main program and return the string `"Global"`

---

#14 — Write 3 methods inside the Person class that would return the outputs shown on lines 23 and 24.

```ruby

class Person
  # attr_reader :friends

  def initialize
    @friends = []
  end

  # method override for left shift in order to add friend object inside the array instance variable @friends
  def <<(friend)
    @friends << friend
  end
  # method override to set an element at a specific idx in the instance variable @friend
  def []=(idx, friend)
    @friends[idx] = friend
  end
  # method override to get the value of an element at a specific index
  def [](idx)
    "#{@friends[idx]}"
  end

  def friends
    @friends.map(&:to_s)
  end

end

class Friend
  attr_reader :name

  def initialize(name)
    @name = name
  end
  def to_s
    name
  end
end

tom = Person.new
john = Friend.new('John')
amber = Friend.new('Amber')

tom << amber
tom[1] = john
p tom[0]      # => Amber
p tom.friends # => ["Amber", "John"]
```

---

#15 — What will be output when the last 2 lines of code get executed?

```ruby
class Foo
  @@var = 1

  def self.var
    @@var
  end
end

class Bar < Foo
  @@var = 2
end

puts Foo.var
puts Bar.var

```

---

#16 — Update the Human class to have the desired output.

```ruby

class Human
    attr_reader :name

  def initialize(name="Dylan")
    @name = name
  end
  include Blondy
  extend Blondy
end

module Blondy
  def hair_color(color)
    puts "Hi, my name is #{name|| "Dylan" } and I have blonde hair."
  end
end

puts Human.new("Jo").hair_color("blonde")
# Should output "Hi, my name is Jo and I have blonde hair."

puts Human.hair_color("")
# Should "Hi, my name is Dylan and I have blonde hair."
```

---

#17 — What does each self refer to in the code snippet below?

```ruby

class MeMyselfAndI
  self # this refers to the class MeMyselfAndI

  def self.me #class MeMyselfAndI
    self #class MeMyselfAndI
  end

  def myself
    self # this refers to instance of class MeMyselfAndI
  end
end

i = MeMyselfAndI.new
```

---

#18— What are some of the characteristics of instance variables?
