array_one = [1, 2, 3]
array_two = [1, 2, 3]
array_three = array_one

p array_one == array_two #true
p array_two == array_three #true
p array_one == array_three #true
p 
p array_one.equal? array_two #false
p array_two.equal? array_three #false
p array_one.equal? array_one #true