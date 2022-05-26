#ask the usre for two numbesr
# ask the user for an operation to perform
# perform the opeartion on the two numbers
# output the results


Kernel.puts("Welcome to calculator.")

Kernel.puts("What is the first number?")
num1 = Kernel.gets().chomp().to_i()
Kernel.puts("What is the second number?")
num2 = Kernel.gets().chomp().to_i()

Kernel.puts("What operation would you like to perform? 1)add 2)subtract 3)multiply 4)divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = num1 + num2
elsif operator == '2'
  result = num1 - num2
elsif  operator == "3"
  result = num1 * num2
else
  result = num1.to_f / num2
end

Kernel.puts("The result is #{result}")