1. What is OOP? List all the benefits of OOP?
   OOP is a paradigm of programming to organize code in objects that encapsulate their state and behaviours. As programs became more complex, it became hard to coordinate and maintain the code. Containers were used to section off data and functions so that each part of the program could be implemented independently. This allows each programmer contributing to the overall architecture to concentrate on their piece of the code and to abstract away the implementation details of the behaviours.

2. What is encapsulation? How is this achieved in Ruby?
   Encapsulation is a core concept in OOP that lets us hide the internal representation of an object implementation of certain behaviours from the outside and only provide the methods and attributes through a public interface that users of the object need.

   This division allows for a consistent interface where public methods can remain the same even if the underlying implementation and functions are changed/improved overtime.

   Ruby accomplishes this through class definitions that describe attributes and behaviours of each instantiation of the class. Attributes can only be accessed through creation of getter/setter methods. While, behaviours are divided between public and private interface.

3. In ruby, we defined classes which are
   Classes are the outline or blueprint that is used to create instantiation of an object. They define all the attributes and behaviours that objects will contain when they are created.

4. What is polymorphism? What are the different ways to apply polymorphism in Ruby?
   Polymorphism refers to the ability of different object types to respond to the same method invocation, often, but not always, in different ways.
   Polymorphism can be applied through inheritance as well as through duck-typing.

   An example would be two objects, one is an instantiation of the `Fridge` class while another is an instantiation of the `Athlete` class. They both have a `.run` method which seems like a common interface between the two objects, however the implementation details of each method is different and the output and return values of each object are unrelated.

5. What is duck typing?
   Duck typing is a concept in programming where we infer the type without verifying the actually object. In ruby this is applied when calling methods using the same interface of different objects. If the calling object contains the method we called, we don't really worry about the actually object or class of the object that we are working with.

6. What is class inheritance? How does this work in Ruby?
   Class Inheritance is a core concept in OOP in which superclass object contain attributes and behaviour common to subclassed objects. The subclasses inherits the behavious of a superclass which allow for organization of code in a hierachical structure and reduces repetition.

7. What is an object? What is a Class? What is a Module?
   An object is an instance of a class, that holds states and has methods. A Class is a blueprint and defines the attributes and behaviours of objects will are instiantiated from that class. A Module is a container that holds methods or classes, and is a way to group methods for interface inheritance and group classes for namespacing

8. What are the differences between classes and modules? How do you decide which to use?
   Classes are meant as a mold for the creation of objects of the given class. They encapsulate attributes and behaviours and it differs from modules, which are meant solely for organizing your methods or classes in containers. You would not create new instances of modules based on a given definition and would simply pass this container around for use. Whereas Classes are meant to produce instances of objects and are considered a factory for new objects.

9. What is instantiation? Provide an example.
   Instantiation is when you create a new object from a given class using the method `::new`, which subsequently calls the constructor method of the class. Built in classes and custom classes alike has this process, and we are able to instantiate built-in class as Arrays and Hashs by calling `Array.new` or `Hash.new`. In the class of custom classes, you can also call `Building.new` given a defined `Building` class.

10. What is the method lookup path? How is it important?
    The method lookup path is the route in which ruby will find a method with a given name and call that method. It will search through modules and superclasses to find the method of the given name. You can confirm the method lookup path of a specific class by calling the `.ancestors` method on the class.

11. How do we create an object in Ruby? Give an example of the creation of an object.
    Custom objects are created by calling the `::new` method on the class and passing in all necessary arguments, built-in objects can also be created this way or implicitly by using syntax that like [] for Arrays or {} for hashes.

12. What is a module? What is its purpose? How do we use them with our classes?
    Modules are a container that are used for several purposes which include interface inheritance, namespacing and module methods. Interface inheritance is to account for behaviours and attributes that cannot be included in a class definition through inheritance due to the lack of multiple inheritance or simply that two clases do not share any hierachial structure. You can include the module into the class to inherit the methods and attributes defined in the module.
    Namespacing is meant to group together classes which could be considered related to one another. The modules also provides a form of context when dealing with the specific class as there are scenarios where classes can have the same name that service completely different purposes.

13. Create a module for the class you created above and include it properly.

14. What is a constructor? Provide an example.
    A constructor is method called when creating an instance of a specific class. In ruby, we use the `::new` method to create an instance of a specific class and in which there may be an initialize method to create instance variables related to that instance.

15. What is an instance variable? Provide an example.
    Instance variables are the attributes of an instance. Tracking all the instance variables of provides the current state of the instance at a given time. An example would be the @name instance variable on an instance of the `Dog` class. When it is created, if an arugment is required in the initialize method, it will set instance variable @name to the inputted argument. And at that point, the state of that object would include the @name instance variable set to "Fido" for example.
    Subsequently the state can change the owner decides to rename the dog "Buddy", hence using a setter method, they reassign the instance variable to the string "Buddy"

16. What is an instance method? Provide an example.
    An instance method are the behaviours that an instance object of a specific class can perform. They are defined in the class definition and subsequently each instantiation of an object of that class will include the behaviours(instance methods) of that class. An example would be providing a instance method on a `Person` class called `greet` in which it tells you their `@name`.
    It is an instance method because it can only be called on instances of the `Person` class and you could call this method on the `Person` class itself.

```ruby
class Person
    attr_reader :name
    def initialize(name)
        @name = name
    end

    def greet
        puts "Hi, my name is #{name}. What's your name?"
    end
end

```

17. What are getter and setter methods? Provide an example.
    Getter and setter methods are instance methods which have the job of providing access to and modification of instance variables. Since ruby does not naturally expose these instance variables for public interface, during class definition, the programmer makes the decision which instance variables do we provide read and write access.

```ruby
class Dog
    def initialize(name)
        @name = name
    end

    def name
        @name
    end
    def name=(n)
        @name = n
    end
end
```

18. What are accessor methods? Provide an example.
    Accessor methods are the short hand of creating getter and setter methods for instances variables.
    They are created by passing the symbol of the instance variable that you want to provide getter or setter methods to.

```ruby
class Cup
    attr_reader :size
    attr_writer :size
    attr_accessor :size
    def initialize(size)
        @size = size
    end
end
```

19. What are class methods? Provide an example.
    Class methods are methods that only pertain to the class and can only be called on the class. They are defined by appending `self` before the name of the method during the class definition.

```ruby
class Candle
    def self.what_am_i
        puts "I am a candle class"
    end
end
Candle.what_am_i
```

20. What are class variables? Provide an example.
    Class variables are variables that are scoped at the class level. Each variable at the class level has only one copy that is shared and accessed by all instances objects as well as subclasses

```ruby
class Turtle
    @@num_turtles = 0
    def initialize
        @@num_turtles += 1
    end
end

```

21. What are constant variables? Provide an example.
    Constant variables are predetermined values that remain the same throughout the execution of the code and are therefore not reassigned. By convention they are created by writing the variable in all caps

```ruby
class Table
    LEGS = 4
end
```

22. What's the difference between instance and class variables?
    Instance variables make up the state of objects that are instantiated from a specific class. They do not exist until they are initialized within an object of that class. They are independent of any other object instance of the same class and therefore they are not shared between instances. Class variable on the other hand pertains to a certain class and therefore there is only one copy. it is the same copy that can be accessed by instance objects of that class as well as subclasses of that superclass. Therefore when it is modified in one place, it will be the same copy that is modified in every other place.

23. What's the difference between instance and class methods?
    Instance methods are the behaviours defined within the class that will be given to each object instantiated from that class. All the objects will contain the same behaviours (instance methods). Most importantly they are behaviours that only instances of the class can perform and are not available on the class itself. Class methods on the other hand, pertain to the class itself and instances of the class will not be able to call these methods.

24. Why do custom classes usually define a `to_s` method?
    `puts` method as well as string interpolation will call the `to_s` instance method. custom classes usually define a `to_s` method in order to override the inherited version which indicates the class of the object along with a unique object id. The overriden `to_s` method will usually provide a more readable description of the instance of that class.

25. What is class inheritance? Provide an example.
    Class inheritance is the ability to subclass from a superclass in order to inherit the attributes and behaviours of a superclass. It is used to reduced code repetition by combining all common attributes and behaviours from subclasses and encapsulating it in a superclass.

```ruby
class Pet
    attr_accessor :name
    def initialize(name)
        @name = name
    end
end
class Monkey < Pet
    def climb
    end
end

class Rat < Pet
    def hide
    end
end
```

26. What is method overriding? Provide an example.
    Method override is when a subclass creates an instance method of the same name that it would have inherited from a superclass. This will override the method definied in the superclass becuase the method lookup path will first find the method in the subclass in which it was defined

```ruby
class Parent
    def eat
        puts 'I eat with a fork and knife'
    end
end

class Child
    def eat
        if rand(2) == 1
            super
        else
            puts "I eat with my hands."
        end
    end
end
```

27. When are Modules used? What is interface inheritance? What is multiple inheritance?
    Modules can be used for multiple purposes. In the case where attributes and behaviours cannot be shared through class inheritance due to the lack of a natural hieriachal structure, you can provide keep the behaviours in a module and include it class definitions where it belongs.
    This is usually called interfacing inheritance because rather then inheriting from a superclass, you are using given the interface that is encapsulated in the module.
    Multiple inheritance is the ability for a sub class to inherit from multiple superclasses. This is not a feature that is available in Ruby and is solved by interface inheritance, where we include a module that contains the behaviours.
28. What is namespacing? When is using namespacing beneficial?
    Namespacing is grouping similar or related classes into a module. It is beneficial to namespace because it makes it easier to recognize the class we are referring and reduces the chance that we will make a mistake when referring to a similarly named class.
29. What is method access control?
    Method access control refers allowing or restrict access to something in particular through access modifier . This is accomplished in ruby through with the keywords `public`, `protected` or `private` on a class definition.
30. How are encapsulation and method access control related?
    Encapsulation is a concept in oop in which we hide away data and implementation details that do no require to be interacted with outside of the instance of the given class and therefore having a public facing interface that provides the approved ways in which to interact is important. This is achieved through method access control in which we defined public and private methods, therefore creating the divide between the public interface vs private implementation details.
31. What are the differences between public, private, and protected methods?
    `public` is the behaviours that are accessible outside of the class definition
    `private` defines methods that can only be accessed by other instance methods within the class definition. they are the hidden implementation details that are not accessible outside of the object
    `protected` is similar to the private in that it is not accessible from outside the object except by other objects of the same class.

32. What are collaborator objects? Why are they important in OOP?
    Collaborator objects are Objects that are stored as state within another object, they are called collaborator objects because they work in conjunction with the other object.
    Collaborator objects play an important role in object oriented design, since they also represent the connections between various actors in your program.
