# Keyword Arugments 

```ruby
5.step(to: 10, by: 3) { |value| puts value }
```

- step is called on the numeric class 
- `to:` is the step by which the number increases with the first step being the calling number
- `by:` is the limit for which the step should stop it will less than or equal to the limit if positive and more than or equal if starting in negative number
  - without this limit it sequence will be of infinite length
- finally when block is given, the value of each step is given to the block
- it will return self when completing sequence
- this will output to the console 
```ruby
5
8
```
- and wil return `5` which in this case is not used
