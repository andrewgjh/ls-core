def compute(input)
  if block_given?
    yield(input)
  else 
    "Does not compute."
  end
end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'
p compute(100) {|input_num| 50*3 +input_num} == 250
p compute("world") {|string| "hello #{string}"} == s"hello world"
p compute(:andrew) == "Does not compute."
