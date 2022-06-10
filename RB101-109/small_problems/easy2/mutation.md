```ruby 
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
```

1. the variable `array1` is initalized and set to an array with 8 strings elements(names)
2. the variable `array2` is initialized and set to an empty array
3. the `Array#each` method is called on `array1` and passed in a block
  - the each method iterates through each element in the array
  - each time passing the element to the block 
  - the block takes the element and adds it to `array2`
4. the `Array#each` method is called on `array1` again and passed in a block
  - the each method iterates through each element in the array
  - each time passing the element to the block 
  - the block takes each element and checks whether the string starts with `C` or `S`
    - if it does, then it uses the `upcase!` method which mutates the caller 

the output should affect `array2` because the elements that were added from `array1` are the same objects and since upcase! mutated the caller
it will also show the upcased names for CURLY, SHEMP and CHICO