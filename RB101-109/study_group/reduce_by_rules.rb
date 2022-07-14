=begin

INPUT is two arguments and array of numbers and an array of rules on how to interact with while looping through integers
OUTPUT IS a single digit representing the result of looping through the rules 

ALGO
set current_rule to 0
set result = nil
loop through the array of numbers using reduce


  

=end


# def reduce_by_rules(array, rules)
#   starting_rule_index = 0
#   array.reduce do |acc, cur|
#     rule = rules[starting_rule_index]
#     starting_rule_index += 1
#     starting_rule_index = 0 if starting_rule_index > rules.size - 1
#     rule.call(acc, cur)
#   end
# end


def reduce_by_rules(array, rules)
  rule = rules.cycle
  array.reduce do |acc, cur|
    rule.next.call(acc,cur)
  end
end



add = Proc.new{|a,b| a + b}
subtract=Proc.new{|a,b| a-b}
mul=Proc.new{|a,b| a*b}
div=Proc.new{|a,b| a/b}
min=Proc.new{|a,b| [a,b].min}
max=Proc.new{|a,b| [a,b].max}



rules = [add, subtract]
p reduce_by_rules([2.0, 2.0, 3.0, 4.0], rules) == 5.0

rules = [add]
p reduce_by_rules([2.0, 2.0, 2.0], rules) == 6.0
p reduce_by_rules([2.0, 2.0, 2.0, 2.0], rules) == 8.0
p reduce_by_rules([2.0, 2.0, 2.0, 2.0, 2.0], rules) == 10.0
p reduce_by_rules([2.0, 2.0, 2.0, 2.0, 2.0, 2.0], rules) == 12.0

rules = [add, subtract, mul]
p reduce_by_rules([2.0, 2.0, 2.0], rules) == 2.0
p reduce_by_rules([2.0, 2.0, 2.0, 2.0], rules) == 4.0
p reduce_by_rules([2.0, 2.0, 2.0, 2.0, 2.0], rules) == 6.0
p reduce_by_rules([2.0, 2.0, 2.0, 2.0, 2.0, 2.0], rules) == 4.0

rules = [min, max]
p reduce_by_rules([1.3, 2.0, 3.3], rules) == 3.3
p reduce_by_rules([4.1, 2.2, 2.1, 2.5], rules) == 2.2
p reduce_by_rules([8.0, 8.1, 4.1, 12.0, 2.0], rules) == 8.0
p reduce_by_rules([2.9, 2.8, 2.7, 2.6, 2.5, 2.4], rules) == 2.4
