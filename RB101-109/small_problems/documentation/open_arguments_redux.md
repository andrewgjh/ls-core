# Optional Arugments Redux

```ruby
require 'date'
puts Date.civil
puts Date.civil(2016)
puts Date.civil(2016, 5)
puts Date.civil(2016, 5, 13)
```

1. line 3 will create a date object and set it to the year -4712 month 1 and day 1 and output a string "-4712-01-01" and return nil
2. line 4 will create a Date object and pass the integer argument 2016 for the year parameter leaving the month and day with default of 1 and so the output string will be "2016-01-01" and return nil from the puts
3. line 5 will create date object and set year to 2015 and month to 5 leaving the day to the default value of 1
and will output the string "2016-05-01"
4. line 6 will again create a date object and set the year to 2016 the month to 5 and day to 13 and output a string "2016-05-13" and return nil from the puts


