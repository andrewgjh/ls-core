# Multiple Signatures

```ruby
a = %w(a b c d e)
puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }
```

1. the first fetch on line 5 will throw an error because the element at index 7 is nil and does not exist in this array 
2. the second fetch will return `"beats me"` because there is no element at index 7 of this array and therefore the second argument which indicates the default value will be returned
3. the final fetch will return the integer `49` because it first trys to find the element at index 7 in the array, since it is not in range it will run the block passed in as an argument. the index argument will be passed to the block and the return value from the block will be returned by the fetch method

* the block will supersede the default_value passed in as the second argument. so it will return the blocks return value instead of the default value.