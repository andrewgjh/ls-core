# Study Guide

1. local variable scope, especially how local variables interact with method invocations with blocks and method definitions

- method definitions have their own local scope, they are not able to access the outer variables unless it is passed in
  - when passed in as an argument, it will point to the same object that the variable is pointing to
    - reassignment will change the pointer
    - mutating calls will change the object affecting the original argument that was passed in
- blocks also have their own local scope where variables created inside the block cannot be accessed outside but it can access outer variable scope if the variable has already been initalize and interact and reassign it

---

2. mutating vs non-mutating methods, pass-by-reference vs pass-by-value

- when dealing with mutable objects, ruby acts like pass by reference while it acts like pass by value when dealing with immutable objects
- when the method is mutating, it is mutating the caller and will affect the original object that called the method
- whereas in a non-mutating method, the original object will not be affect and the method will return a new version of the object you are working with

---

3. working with collections (Array, Hash, String), and popular collection methods (each, map, select, etc). Review the two lessons on these topics thoroughly.

### each

> - `each` method iterates through an array or hash. through each iteration, it passes the element to the block that was passed in as an argument
> - when the block runs, the return value is ignored by the each method and at the end, it returns the original calling array or hash

### select

> - `select` method iterates through an array or hash and through each iteration, it passes the element or key/value pair to the block as an argument
> - the select method looks at the truthiness of the return value of the block
>   - if the block's return value evaluates to true that element will be included in the new array
>   - whereas if the block's return value evaluates to false then that element would not be included in the new array
> - after the iteration process is complete the select method will return a new array object - this is an example of selection

### map

> - `map` method iterates through each element in a collection and accepts a block as an argument
> - through each iteration the element is passed to the block
> - the map method uses the return value of the block through each iteration as the value at the same index in the final array that is returned
> - the array that is returned is a new object and does not mutate the original array that called the map method

---

4. variables as pointers

- variables are pointers to an address in memory and do not actually contain the values that they represent
- when reassignment happens, variables will point to a new address in memory
- whereas if a mutating method is called, the pointer is not changed to a new address in memory but the actually object being pointed to has its value changed

---

5. puts vs return

- each method has a return value and the last line is the return value unless you explicitly use the `return` keyword elsewhere in your code
- the puts method has a side effect that take the arguments passed to it and prints them to the console but the return by the method is nil

---

6. false vs nil and the idea of "truthiness"

- nil is a special object that represents the absense of a value
- false is boolean object
- each object can be evaluated to either true or false
  - in ruby every object is truthy except for `false` and `nil`
- so truthiness is the ability to evaluate any object other than `false` or `nil` to `true`

---

7. method definition and method invocation

- method definition is when it is created and stored in memory
- it is given a name so it can be called at a later time and parameters that will be accepted are listed in the definition
- any thing within the method definition is stored and not evaluated until invocation
- when a method is called, arguments need to be passed to it if parameters were defined, it is retrieved from memory and evaluated and will provide a return value at the end of execution

---

8. implicit return value of method invocations and blocks

- in ruby, the return value is implicitly the last line of a method or block
- you can override this by explicitly using the `return` keyword
  - all code that comes after the evaluated `return` will not be run
- all methods and blocks has a return value, if not value is provided then `nil` will be returned

---

9. how the Array#sort method works

- the sort method uses the comparision(spaceship) operator `<=>` and elements being compared need to be in the same class
  - when the element being compared on the left is larger, it will return `1`
  - when the element on the left is smaller it will return `-1`
  - when they are equal, it will return `0`

EXAMPLES

```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```

- The local variable greeting is assigned to the String 'Hello' on line 1. The do..end alongside the loop method invocation on lines 3 to 6 defines a block, within which greeting is reassigned to the String Hi on line 4. The puts method is called on line 8 with the variable greeting passed to it as an argument; since greeting is now assigned to 'Hi', this is what is output. This example demonstrates local variable scoping rules in Ruby; specifically the fact that a local variable initialized outside of a block is accessible inside the block.




