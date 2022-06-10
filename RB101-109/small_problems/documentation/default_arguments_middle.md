# Default Arugments in the Middle

```ruby
def my_method(a = 1, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
```

- default positional arguments determines the order in which arguments are used when there are default values in the middle of the parameters of the method definition
- in this example the first argument `4` is assigned to the variable `a`
- the last argument `6` is assigned to the variable `d` 
- finally from left to right of the variables that have default values the argument `5` will be passed the variable `b` to replace the default value of `2`
- since there are no more arguments `c` will remain the default value of `3` 
the output will therefore be `[4, 5, 3, 6]`