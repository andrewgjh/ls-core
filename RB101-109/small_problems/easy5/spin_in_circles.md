You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

```ruby
def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"
```

- It will not return the same object because when you used the split method it created an array of the words and so the reverse! method was mutating the elements of the array object and not the original str object. and the join will return a new str object which the mutated elements in the array. 