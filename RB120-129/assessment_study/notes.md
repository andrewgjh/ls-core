# STUDY GUIDE

- [x] Classes and objects
- [x] Variable Scope
  - Inheritance and Variable Scope
- [x] Method Overriding
- [x] super
- [x] Use attr\_\* to create setter and getter methods
- [x] How to call setters and getters
- [x] Instance methods vs. class methods
- [x] Method Access Control
- [x] Referencing and setting instance variables vs. using getters and setters
- [x] Class inheritance, encapsulation, and polymorphism
- [x] Duck Typing
- [x] Modules
- [x] Method lookup path
- [x] self
  - Calling methods with self
  - More about self
- [x] Equality
- [x] Fake operators
- [x] Working with collaborator objects
- [x] Exceptions

---

## Classes and Objects

- Classes are the blueprint or mold used to create instances of the object

  - classes are defined using PascalCase for example `class Building; end;` or `class GymEquipment; end;`
  - it defines the attributes and behaviours that objects of that class can have i.e instance variables and instance methods
  - as well as its own attributes and behaviours i.e class methods and class variables

- Objects are instances of a specific class

  - the process of creating an object from a class is called instantiation
  - an object is returned by calling the `.new` method on the class
    - it can then be stored in a variable for example `cn_tower = Building.new()` or `dumbbells = GymEquipment.new`
  - objects are defined by their states and behaviours

    - **state** is what tracks the objects attributes
      - these are stored in instances variables that be accessed/modified
    - **behaviour** are what the object is capable of doing and are defined by instance methods

    - different objects instantiated from the same class will have the same behaviours
      - but can maintain different states through their attributes

---

## Variable Scope and Inheritance

1. Instance Variable Scope

- `@instance_variable` are scoped to instances of a class (at the object level)
- they are created by appending `@` symbol in front of the variable name
- there use is to track attributes that make up the state of an object of a certain class
- they can be accessed and created inside any instance methods of that object without the need to be passed in as an argument
- they are not able to be directed accessed/modified outside from outside of the object, setter/getter methods must be used to interact with the instance variable
  > ### Inheritance
  >
  > - With regards to class inheritance, instance variables are not inherited, only instances methods are inherited
  > - therefore if an instance method initializes an instance variable in the superclass, it will look like the instance variable was also inherited in the subclass
  > - however if an instance method was overriden in the subclass, the instance variable initialized in the superclass will not be initialized in the subclass and will evaluate to `nil` until it is initialized in the overriden instance method or any other method in the subclass (not just the method definition, intialization means the method actually gets called)

2. Class Variable Scope

- `@@class_variables` are scoped to the class level and all objects instantiated by the class will share the same class variable
- it is initialized by appending `@@` in front of the variable name and defined on the class itself
- it can be accessed and munipulated by class methods and instance methods and do not need to be passed in as an argument

  > ### Inheritance
  >
  > - a subclass is able to access the class variables of a superclass
  > - in fact the subclass is also referencing the same copy of the class variable from the super class and therefore it would affect the superclass as well if the class variable is reassigned or mutated
  > - for this reason, it is recommended to avoid class variable when working with inheritance

3. Constant Variable Scope

- constant variables are variables that should not be reassigned (ruby will not stop you from reassigning it but will output a warning indicating that this should not be done - no error will be raised)
- they have lexical scope meaning that they are available in the surrounding stucture that it is defined
- it searched for the constant within the class or module they are defined and will continue to look outwards to outer modules / class that enclose the
  where the CONSTANT is called
  - it is not able to access the CONSTANT if it is inside an adjacent module/ class
    > ### Inheritance
    >
    > - after ruby tries to resolve a CONSTANT lexically and cannot find the CONSTANT,
    > - it will go up the lookup path found by calling `.ancestors`
    > - starting at the class/ module where the CONSTANT was referred to
    > - therefore it might be good practice to append `self.class::CONSTANT` when referencing the constant in a method that is inherited from a module or superclass while the CONSTANT is initialized in a subclass

---

## Accessor Methods

- In order to access/modify instances variables on an object in Ruby, it is necessary to have setter and getter instance methods which are defined within the class
- For example an object has an instance variable `@name`
- in order to access this variable outside of the object as well within the object from other instances methods

  - you will need to create instance getter/setter methods

- this would be the getter method to access the object stored in the instance variable `@name`

```ruby
def name
  @name
end
```

- this would be the setter method to modify the instance variable `@name`
- it is very important to note these setter methods always return the input argument even if you have a different last line of code in the method definition or explicity try to return something else by using the `return` keyword
  - it won't work and it will only return the original argument that was passed in

```ruby
def name=(n)
  @name = n
end
```

- these methods are so common in order to access/modify instance variables that ruby has created several methods that allow you to create these setter and getter methods without actually writing the method definitions

  - you call the method depending on whether you want the getter, setter or both methods to be available
  - then as arguments to the method call you pass in the instance variable names as symbols

  ```ruby
  attr_reader :name # this creates the getter method
  attr_writer :name # this creates the setter method
  attr_accessor :name # this creates both the getter and setter methods
  ```

- you would still use the regular method definitions for the getter and setter if you would like to modified the output before returning or if you want to filter the information that an instance variable can be set to

```ruby

def doctors_name
  "Dr. #{@name}"
end

def doctors_name=(n)
  @name = n unless n == "House"
end

```

---

## How to call Setters AND Getters

- when using the getter method outside of the object to access the instance variable you can write this code `person.name`
  - where the `person` refers to an instance of a `Person` class
- when accessing the instance variable from within the object perhaps in another instance method, you can simple call the method `name`

  \*\* _you can also use `self.name` to call the method but this is not recommended as `self` should be avoided when unnnecessary_\*\*

- when using the setter method outside of the object to modify the instance variable you can write `person.name = "John Doe"`
  - this is ruby syntactical sugar which is actually a method call equivalent to `person.name=("John Doe")` and not a variable assignment `=`
  - once again in this scenario `person` is an instance of the `Person` class
- in order to call a setter method within the object in another instance method, it is important to append `self` in front of the method call otherwise ruby will think that you are trying to initialize a local variable and assigning it a value inside of the method instead of calling the setter method for the instance variable you are trying to modify

---

## Instance Methods vs. Class Methods

- _Class Methods_ are called on the class and do not need an instance object of the given class
  - for example with the class `GymEquipment`, we can call a class method `GymEquipment.options`
  - in this example `options` is a class method defined on the class `GymEquipment`
- to create a class method they require `self` to be appended in front of the method name during method definition
- class methods have functionality that do not pertain to objects of that class

```ruby
class GymEquipment
  def self.options
    # code to give the options of GymEquipment
  end
end
```

- _Instance Methods_ is the behaviour of object instances of a certain class
- they are defined when the class is created by writing a method definition without `self` appended to the method name
- all objects instantiated from the same class should have the same methods(behaviours)

```ruby
class GymEquipment
  def clean
    # code to clean an instance of GymEquipment
  end
end
```

---

## Method Access Control

- Access Control is implemented through _access modifiers_
- its main purpose is to restrict access to certain methods defined in the class
- these creates a `public` interface of specific methods that can be accessed from the outside
- while methods that are only meant for internal use
- by the object itself or objects of the same class will be `protected` or `private`

1. `public` methods are accessible by anyone inside and outside of the object
2. `private` methods are only accessible by the class itself and are usually called by other instance methods but not accessible by rest of the program
3. `protected` methods are similar to `private` methods in that they cannot be called from outside the class however they can be called by other instances of the same class

---

## Referencing and setting instance variables vs. using getters and setters

- When you reference or set an instance variable by using the `@` sign in front of the variable
- you will have access to the object that is being pointed to in the instance variable which is available anywhere inside the class
- for example `@weight_lbs` in the object `dumbbell` from the class `GymEquipment`
- this can be accessed/modified by any method within the `GymEquipment` class
- it however cannot be accessed outside of the class with the `@weight_lbs` syntax
- _(there is a method that will allow you to access/modifier the variable called `.instance_variable_get` and `.instance_variable_set` )_
- but it is not recommended to be used and we should instead rely on getter and setter methods defined by the class
- the reason for using the getter and setter methods to access instance variables is because this allows for customization in the process of retrieving and setting the value of the instance variables
  - you may want to filter the results returned by the getter method rather than providing the raw object in the `@instance_variable`
  - as well you may not want certain criteria reassigned to `@instance_variable` and when filtered through a setter method, you can weed out the input values that should not be accepted

---

## Class inheritance, encapsulation, and polymorphism

### Inheritance

- inheritance is when a class assumes/inherits all the behaviours of another class
  - the one inheriting the behaviours is called the **subclass**
  - and the one it inherits from is called the **superclass**
- it is used to extract all common methods of subclasses and group them in a superclass
  - this allows our logic to be kept in one place and reduces the need for repetitive code
- a superclass can subclass to an unlimited amount of classes however a subclass can only inherit from a single superclass
  - this is specific to ruby while some other languages allow for **multiple inheritance** where a subclass can inherit from multiply superclasses (this is not possible in ruby)
- in order to inherit a superclass you simple use `<` symbol next to the name of the class you are subclassing and put the superclass on the right side of the symbol

```ruby
class FreeWeight < GymEquipment; end;
```

### Encapsulation

- encapsulation is one of the key pillars of OOP
- it is about hiding away functionality and attributes of an object as a form of data protection so that it cannot be multiplated or changed in any way you want
- the object will have a public interface which exposes methods in which there are approved ways to interact with the data

### Polymorphism

- another pillar of OOP, it stands for _many forms_
- its essence is to provide different classes with the same method names that perform different actions and the return value will be unique to the class that is calling the method
- the purpose is that when the method is called, we can use the same method for different objects without worrying about the internal operations of that method and the calling object will each individually perform their unique tasks and provide a return value relevant to the calling object
- an example might be that an object from the `Lion` class and an object from the `Tank` class can both have a method named `attack`
  - however under the hood, they may perform very different tasks and the return values will be unique to each object calling the `attack` method
- however for our purposes, we only care that we can call the `attack` method on whichever object we happen to be working with at that time.

---

## Method Overriding and Super

- when dealing with inheritance, instance methods from a superclass will be inherited by a subclass
  - but there are scenarios where you don't actually want the subclass instance method to do the same thing as the superclass
  - this is when you would rewrite the subclass instance method to override the superclass method
    - in essence during method lookup, it will find the instance method in its own class definition and not traverse to the superclass to find that method
- however sometimes you still want the functionability provided my the superclass instance method and simply want to add to that functionality

  - this is when you can call the `super` method which gets the method of the same name and from the super class and runs that inside the overriden instance method

- when dealing with `super` it is important to note the scenarios for what happens to arguments that are passed into the overrriden instance method based on how you call `super`

1. `super` => this will pass on the arguments passed into the method to super, even if there are too many or too little
2. `super()` => this will call the superclass method without passing any arguments to it
3. `super(name, age)` => the final option is to list out all the required arguments to be passed to super and keep remainding ones for the method implementation itself

---

## Modules

- A module has several purposes
  1. to provide shareable methods functionality between classes that do not share an inheritance chain also called _interface inheritance_
  2. to create namespacing between classes that shared similar charactersitics
  3. to be used as a container to house a collection of methods

1. Shareable Methods Modules (Mixins)

- certain classes may not naturally fall into a hierarchical structure where inheritance is possible
- as well, some classes could be the perfect union between two superclasses, however in ruby multiple inheritance is not possible
  - therefore the solution in ruby is to extract the behaviours that cannot be inherited and place it in a container called a **module**
- then you can _mixin_ the `module` in the required class in order to reduce code repetition and to share behaviours

```ruby
module RustProof
  def spray
    # method to spray on rustproofing
  end
end

class GymEquipment
  include Breakable # use include to create the instance methods
  include RustProof # can mixin as many modules as you want into a class
end

class Car
  include RustProof
  extend Breakable # use extend to create class methods
end
```

2. Namespacing

- organizing classes into a module that are related to one another
- and more importantly it allows for classes that are named the same but actually produce different types of objects to be namespaced into their correct category

```ruby
MusicGenre::Rock.new
Geology::Rock.new
```

- in this example although we have created two Rock objects, they are completey different types of objects that are not related to one another
- however we are able to use namespacing to call them both `Rock`

3. Container - Module Methods

- groups methods into a container inside module
- all the methods need to have `self` appended before the method name
- you can call the methods using dot `.` or `::`

```ruby
module BookStore
  def self.restock_shelf
  end
  def self.display_bestseller
  end
end

Bookstore.restock_shelf
Bookstore::display_bestseller
```

---

## Method Lookup Path

- This is the order in which ruby will go looking for a method when called by an object
- the order of classes and modules that it will look through can be found by calling `.ancestors` on the object that will be calling the method in question
  - it will use the first method that it encounters in the lookup path with the same method name
  - if none of found in the lookup path, it will raise an exception of NoMethodError
- so basically it will first look within its own class definition
  - then it will look in all modules including in the class definition
- and then it will continue to traverse going up from superclass to all included modules until either the lookup path ends or the first method matching is found
- when including multipy modules in your class creation
  - it is important to note that the last module included will be sooner in the lookup path than those that were included earlier in the code

```ruby
class Car
  include Flyable
  include AutoPilot # this module will be search during method lookup before Flyable module
end

```

---

## Self

- `self` represents different things depending on where it is called

1. from within an instance method, it is referring to the calling object

- it is necessary to use `self` when calling setter methods inside instance methods because this makes it explicit that you are calling a method instead of initializing a local variable and assigning it a value

```ruby
class Dishwasher
  attr_accessor :detergent_added
  def initialize
    @load = []
    @detergent_added = false
  end

  def start_dishwasher
    # self appended in front of setter method detergent_added otherwise it will initialize a local variable detergent_added instead of modifying the instance variable @detergent_added
    self.detergent_added = true
  end
end
```

2. from outside of an instance method and within the class definition, it is referring to the class itself.

- as `self` within the class definition refers to the class being defined, it is appended in front of any method definitions that are class methods that are to be called on the class itself

```ruby
class Dishwasher
  @@manufacturer = "BOSCH"
  # the self in front of the method creates a class method which is called on the class itself without instantiating an object of that class
  def self.manufacturer
    @@manufacturer
  end
end
```

---

## Equality

1. `==`

- it is important when testing for equality to understand whether you want to test if certain values of two items are the same or if they are in fact the same object being referenced by a different variable name
- when `==` is used on strings that have the same value, they evaluate to being equal

  - this is actually not the default for custom classes that use `==`
  - this is because `==` is in fact a method and not an operator
  - removing rubys syntactical sugar the method would be called like so `object.==(other_object)`
  - therefore the `String` class had a method override on `==` in order to check for value equality instead of object equality

    ```ruby
    string_one = "test_string"
    string_two = "test_string"
    string_one == string_two # this is true because it tests for value equality and doesn't care that string_one and string_two are two different objects

    ```

  - this is true of the `Array` and `Hash` classes as well, in that they are overriden to check for value equality
  - in ruby since `Integer` and `Symbol` objects are immutable, their value points to the same object even when they are initialized and set at different times

  ```ruby
  symbol_one = :test_sym
  symbol_two = :test_sym
  symbol_one == symbol_two # this is true because symbol_one and symbol_two in fact point to the same object
  ```

  - therefore when creating your own custom classes, it is important if you wish to check for value equality between attributes of an object, you will need to define an `CustomClass#==` method that overrides the inherited `Object#==` method

  ```ruby
  car_one = Car.new("Honda")
  car_two = Car.new("Honda")
  car_one == car_two # this is false unless you have created a method override for #== that checks for the value equality
  ```

2. `#.equal?`

- in order to check for object equality => meaning they are actually the same object being referenced by different variable names, you can use the `.equal?` method

```ruby
array_one = [1, 2, 3]
array_two = [1, 2, 3]
array_three = array_one


# these all evaluate to true because they are checking only for value equality
array_one == array_two # true
array_two == array_three # true
array_one == array_three # true

# only the last line will evaluate to true because only array_one and array_three point to the same object in memory
array_one.equal? array_two #false
array_two.equal? array_three #false
array_one.equal? array_one #true
```

3. `===`

- this is another instance method that is used implicitly when working with `case` statements
- it checks if the calling object is a group, the argument inputted is a part of that group

```ruby
# these are all true because the caller being the group, the input argument all below to their respective group
String === "hello" # true
Array === [1, 2, 3] # true
(1..50) === 38 # true

#obviously false because input argument is not part of the group
Symbol === "I want to be a :sym" #false
:hello === "hello" #false
```

4. `eql?`
   -the `eql?` method returns `true` if obj and other refer to the same hash key
   - it determines if two objects contain the same value and they are of the same class

## Fake Operators

- in ruby there are many instance methods in classes when written look like operators because ruby provide special syntax
  - therefore when we create our own custom classes, we can override these instance methods to provide a return value that is custom to our own class
    here is a list of custom methods that look like operators in ruby
- `#[]` => collection getter
- `#[]=` => collection setter
- `#**` => exponential operator
- `#!` => not
- `#~` => complement (flips the bits)
- `#+@` => unary plus
- `#-@` => unary minute
- `#*` => multiply
- `#/` => divide
- `#%` => modulo
- `#+` => binary plus
- `#-` => binary minus
- `#>>` => right shift
- `#<<` => left shift
- `#&` => bitwise and
- `#^` => bitwise xor
- `#|` => bitwise or
- `#<=` => less than or equal
- `#<` => less than
- `#>` => greater than
- `#>=` => greater than or equal
- `#<=>` => equality (spaceship)
- `#==` => equality
- `#===` => group equality
- `#!=` => not equal
- `#=~` => String pattern matching (regex)
- `#!~` => Not matching pattern (regex)

## Collaborator Objects

- Objects that are designed to be stored in the state of another object
  - collaboration may not occur when object is initialized but later on when certain method is called and the object state is changed
  - however the it is considered a collaborator object based on the design/intention of the program before the state reflects this collaboration
- Colloborator objects are also said to send or be sent messages between each other
- they can be any type of object class from Array, Hash, String to custom classes
- can usually be conceptualized by a has-a relationship
  - a library has books => books are collaborator objects to books
  - a restaraunt has food => food is a collaborator object to restaurant
  - a company has employees => employees are collaborator objects in company

## Exceptions

- exceptions are exceptional states in a program
- in ruby the top of the hierachy is the `Exception` class
  - all other exceptions are subclassed from ths exception
- handling an exception is meant to provide a graceful way for your program to handle a situation that did not follow your happy path
- if exceptions are not handled, it will halt execution of your program usually displaying the exception that was raised

  - you can handle exceptions by using the `rescue` block and specifying the type of exception that you want to handle and the code/action you would like to take given that exception

  ```ruby
  begin
  # some code at risk of failing
  rescue RuntimeError
    #display the error message
  rescue ArgumentError
    # do some other action reacted to the argument error
  end
  ```

  - it is important not to handle the top level `Exception` class and be specific about the types of exceptions that you would like to handle
  - within the `begin/rescue` block, you can add an `ensure` block if there is something that you would like to at the end of the exception handling
  - such as closing a file that you try to read/write

- you can also `raise` your own exceptions from any of the `StandardError` class or even create your own exception by subclassing from one of the exception classes
