# STUDY GUIDE

- [x] Closures, binding, and scope
- [x] How blocks work, and when we want to use them.
- [x] Blocks and variable scope
- [x] Write methods that use blocks and procs
- [x] Understand that methods and blocks can return chunks of code (closures)
- [x] Methods with an explicit block parameter
- [x] Arguments and return values with blocks
- [x] When can you pass a block to a method
- [x] &:symbol
- [x] Arity of blocks and methods

Testing With Minitest

- [ ] Testing terminology
- [ ] Minitest vs. RSpec
- [ ] SEAT approach
- [ ] Assertions

Core Tools/Packaging Code

- [ ] Purpose of core tools
- [ ] Gemfiles

## Closures, binding, and scope

- _Closure_ is a programming concept which allows a programmer to save a chunk of code that can be executed at a later time
- It is called a closure because it binds the surrounding artifacts ( variables and methods)
  - building an enclosure that it can reference when the closure is executed
- in Ruby closure is implemented by Procs, Lambdas and Blocks
- _binding_ is the reference to the surrounding artifacts that a closure maintains
  - the bindings are any methods and variables that are defined in scope before the closure is created
  - it is important to remember that the binding is to the variable pointer and therefore if the variable pointer changes, the binding will also have access to the new object being pointed to by the variable

```ruby
a = "green"
["tree", "car", "house"].map do |noun|
  "#{a} #{noun}"
end
```

In this block of code, the variable `a` is defined in the same scope as where the block is created delimited by the `do...end`. This means the block closure creates a **binding** to the variable reference `a` and will be able to access the value store at `a` when the closure is called at a later time

```ruby
colour = "green"
a_proc = proc { |noun| "#{colour} #{noun}" }

def method_enclosure(a_proc)
  colour = "blue"
  ["tree", "house", "car"].map(&a_proc)
end
p method_enclosure(a_proc)
#---------------------------------
colour = "green"
a_proc = proc { |noun| "#{colour} #{noun}" }

def method_enclosure(a_proc)
  colour = "blue"
  ["tree", "house", "car"].map(&a_proc)
end
colour = "red"
p method_enclosure(a_proc)
```

this code snippet is a modification to the previous code snippet and further demonstrates closures and bindings in action
procs are a way to implement closures and the `a_proc` variable references a closure which has bindings to the variable `colour` that is defined in the same scope. Subsequently, the proc is passed in to the definition of `method_enclosure` where it is further passed to the `Array#map` method. When the proc is converted to a block and executed, it maintained the binding of the variable `colour` defined when the closure was created and accessed the string object with value `green` and ignored the local variable with the same name `colour` defined inside the method definition pointing to string object `blue`

in the second version of this code snippet, the variable `colour` is reassigned to `red` in the outer scope and therefore the proc that was passed in will maintain the same binding to the variable `colour` in the outer scope and ignore the local variable with the same name `colour` initialized within the definition of `method_enclosure`. Ultimate the string object `red` will be used when evaluating the proc passed to the `.map` method.

## Blocks and variable scope

- The block is an argument to the method call.
- `[1, 2, 3].each { |num| puts num }`, is actually passing in the block of code to the `Array#each` method
- In Ruby, every method can take an optional block as an implicit argument.
- in order to access this implicit block argument, within the method definition, you can use the `yield` keyword to execute the block
- if the `yield` keyword is used and no block was passed in as an argument, then this will raise the `LocalJumpError`

  - this is when you can use the method `Kernel#block_given?` to confirm that a block was passed before yielding to the implicit block

- there are two main use cases for blocks

  1. when you want to defer implementation of code to method invocation, this allows for you to create generic methods that leave certain implementation details to the caller of the method
  2. methods that need to perform before and after actions(sandwich code).

## Block Parameters

- a block also accepts parameters which we call `block parameters`
  - within the block, the accepted parameters are listed and delimited by the pipe symbol `|...|` these are called _block local variables_
    - the scope of these block local variables are constrained to the block
  - block parameters should be uniquely named in order to avoid variable shadowing which would stop the block from accessing variables defined outside the block with the same name

## Methods with Implicit vs Explicit Blocks

A method can either take a block implicitly as an argument or explicitly, in order to add an explicit block, during method definition you append the `&` symbol in front of the variable that you want your block to the named as the last argument. That way when a block is passed to the method, it will convert it to a `Proc` object and the variable used to represent the passed in block will point to that `Proc` object

```ruby
def explicit_blocks(&child_block)
  if block_given?
    puts "I need to take care of this child_block"
    child_block.call
  else
    puts "I will travel the world"
  end
end

explicit_blocks {puts "Waaaaaaaa! Feed me"}
puts "----------------"
explicit_blocks
```

In this code snippet, the block is explicitly defined on the method implementation with the given variable name `child_block`, the `&` is prepended at the front of the variable name to denote that it is the variable to used for the passed in block. It is important to note that this is just a way to name the block and convert it into a Proc object but it does not mean that the argument is required when calling this method. within the method definition, you are able to use the Proc object
simply by using the `.call` method to invoke the code within the Proc.

Explicit blocks are useful because it provides a handle(variable name) in which we can refer to the block. This is important because we can now pass the block around to other methods if we require. This is more flexible then simply using the `yield` keyword to yield execution to the block.

Also important to note that you cannot pass in both an explicit block and an implicit block. each method invocation only accepts one block.

## Arity of blocks and methods

- the rule regarding the number of arugments you must pass to a block, proc or lamdba is called _arity_
- in ruby, procs and their converted blocks have **lenient arity**

  - lenient arity means that it does not enforce the arguments passed to the block
  - if there are too many, then the parameters defined will be associated with the arguments that come first and any extra arguments will be ignored
  - if there are not enough arguments passed to the block, any missing arguments will evaluate to `nil` when used within the block

- methods and lambdas have **strict arity**
  - this means that an exception will be raise if the correct number of arguments is not passed to the methods or lamdbas

## Arguments and return values with blocks

- methods can return a chunk of code by returning a Proc or lambda
- this also create closure and provides the binding to all methods and variables that are created during method invocation
- it is important to note that the binding is associated with variables from the method invocation and therefore each time the method call creates its own copy of the variables and methods that the proc has access to.

```ruby
def pizza_store
  toppings = ["cheese", "sauce", "mushroom", "pepperoni"]
  Proc.new do |new_topping, idx|
    toppings[idx] = new_topping
    p toppings
  end
end

employee1 = pizza_store
employee1.call("chicken", 1) # => ["cheese", "chicken", "mushroom", "pepperoni"]
employee1.call("meatball", 2) # => ["cheese", "chicken", "meatball", "pepperoni"]

employee2 = pizza_store
employee2.call("meatballs", 2) # => ["cheese", "sauce", "meatballs", "pepperoni"]

```

In this code snippet, we can see that the variable `toppings` is initialized with an array of `cheese, sauce, mushroom, pepperoni` strings
When the `pizza_store` method is invoked and we store the return `Proc` object in the variable `employee1`, it is binded to the variable `toppings`
Therefore when we invoke the `.call` method on the Proc object `employee1`, it is able to change the toppings at a given index. What is more important is that a second invocation of the method `pizza_store` returns another Proc object stored in the variable `employee2`, the closure of `employee2` creates binding to variable `toppings`, however it is a brand new copy of object stored in `toppings` and therefore the the Proc that was invoked from `employee1` affects one copy of `toppings`
while the Proc invoke by `employee2` affects a completely seperate copy of the variable `toppings`

# &:symbol

When we call methods such as `map`, `select`, `each`, we sometimes pass in a Proc object as an explicit argument like this `.map(&:to_i)`
in this scenario, the `&` indicates that we want to convert a proc into a block, However what we are in fact passing is the symbol `:to_i`, so therefore in the background ruby takes this symbol and calls the method `to_proc` in order to convert it into a proc and then it is converted to a block that is passed to the `.map` method.

```ruby
class FakeProcClass
  def to_proc
    Proc.new {|x| p x + 2}
  end
end

my_proc_class = FakeProcClass.new

[1,2,3].map(&my_proc_class)
```

Therefore you can see that in fact we can pass any object to the variable prepended by the `&` as long as it has a `to_proc` method for that object. In this code snippet, I have created my own class called `FakeProcClass` and defined a `to_proc` instance method, in which I return a real proc object that adds `2` to inputted block argument. I instantiated an object of the `FakeProcClass`and passed that object as the explicit block argument in the `map` method. This does not raise an exception and in fact calls the returned Proc object from the `to_proc` method that was defined on my `FakeProcClass`

## Testing terminology

- Test Suite => entire set of test that accompany a program or application (all the tests)
- Test => describes a situation or context in which tests are run
- Assertion => this is the verification step to confirm the data return by the program is what is expected
- Use code coverage as a metric to gauge test quality. (But not the only metric.)

## Using MiniTest

- Minitest is a bundled gem
- to use minitest `require 'minitest/autorun'`
  - create class subclass from `Minitest::Test` or `MiniTest::Test`
  - create instnace methods within the class that start are prepended with `test_`
- skip (to skip a test) at the start of the instance method
-

## Minitest vs. RSpec

- RSpec is what we call a Domain Specific Language
- allow developers to write code that reads like natural English
- expectation syntax vs assertion(assert-style) syntax
  - rspec uses describe blocks with individual test (it) method
- minitest has both assertion and expectation style syntax

## SEAT approach

- Setup the necessary objects
- Execute the code against the object we're testing
- Assert the results of the execution
- Teardown and clean up any lingering artifacts

- setup and teardown runs for every test

## Assertions

- assert => checks the truthiness of the value
- assert_equal => checks for equality using the `#==` method
- assert_same => checks that it is the same object using `.equal?` method
- assert_nil => checks that object is `nil`
- assert_empty => calls the `.empty?` method
- assert_match => uses regex pattern matching
- assert_in_delta => when working with floating point numbers
- assert_raises => checks for exception when executing the block
- assert_instance_of(cls, obj) => checks that the object is the correct class (using `Object#instance_of?` method)
- assert_kind_of(class, obj) => checks that the obj is a kind of class which includes all subclasses (using `Object#kind_of?` method)
- assert_includes(collection, obj) => checks that the collection includes the obj
- assert_output => checks the stdout for messages that match what you are looking for.
- assert_silent => check that the stdout/stderr is silent and does not print anything
- assert_responds_to(obj, method_in_sym) => checks if an obj has a specific method

Purpose of core tools

- RubyGems (Gems) packages of code to download, install and use in your ruby programs
- Bundler (dependency manager) => managing various dependencies in a Ruby project.

  - Gemfile and Gemfile.lock is part of bundler
    A Gemfile typically needs four main pieces of information:

    1. Where should Bundler look for Rubygems it needs to install?
    2. Do you need a .gemspec file?
    3. What version of Ruby does your program need? (Recommended, not required)
    4. What Rubygems does your program use?

- Prepending `bundle exec` to your command may solve this.
- Rake => Automates common functions required to build, test, package and install programs

  - Set up required environment by creating directories and files
  - Set up and initialize databases
  - Run tests
  - Package your application and all of its files for distribution
  - Install the application
  - Perform common Git tasks
  - Rebuild certain files and directories (assets) based on changes to other files and directories

- RVM / rbenv => lets you install manage and use multiple versions of Ruby
