```ruby
name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name
```

1. the string object with value of `Bob` is assigned to the initialize variable `name`
2. the variable `save_name` is initialize and points to the same string object as the variable `name`
3. the variable `name` is reassigned to a new string object with the value of `Alice`
4. the puts method is called and passed in two arguments 
  - variable `name` which points to the str object `Alice`
  - variable `save_name` which points to the str object `Bob`


```ruby
name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
```

1. the variable `name` is initialized and assigned a string object with the value `Bob`
2. the variable `save_name` is initialize and points to the same string object as the variable `name`
3. the method `upcase!` is called on the variable `name`, since this method will mutate the caller, the original object is changed 
4. therefore when the puts method is called on the two variables
  - variable `name` points to str object with value `BOB`
  - variable `save_name` points to the same object with value `BOB`