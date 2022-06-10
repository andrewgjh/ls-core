# Mandatory Blocks

```ruby
a = [1, 4, 8, 11, 15, 19]
```

- you could use ruby binary search method `Array#bsearch` and passed a block where the element is passed in and checked for a truthy return from the block
```ruby 
value = a.bsearch {|n| n > 8 }
```