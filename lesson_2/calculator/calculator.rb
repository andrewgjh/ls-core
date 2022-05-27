require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  Integer(num)
rescue StandardError
  false
end

def operation_to_message(op)
  word = case op
         when "1"
           MESSAGES["word_add"]
         when "2"
           MESSAGES["word_subtract"]
         when "3"
           MESSAGES["word_multiply"]
         when "4"
           MESSAGES["word_divide"]
         end
  word
end

num1 = ""

prompt(MESSAGES["welcome"])
name = ""
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}")
loop do # main loop
  loop do
    prompt(MESSAGES["first_number"])
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt(MESSAGES["valid_number"])
    end
  end

  num2 = ""
  loop do
    prompt(MESSAGES["second_number"])
    num2 = Kernel.gets().chomp().to_i()
    if valid_number?(num2)
      break
    else
      prompt(MESSAGES["valid_number"])
    end
  end
  
  prompt(MESSAGES["operator_prompt"])
  operator = ""
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES["operator_valid"])
    end
  end

  prompt("#{operation_to_message(operator)} #{MESSAGES['operator_message_two_nums']}")

  result = case operator
           when "1"
             num1.to_i + num2.to_i
           when "2"
             num1.to_i - num2.to_i
           when "3"
             num1.to_i * num2.to_i
           when "4"
             num1.to_f / num2.to_i
           end
  prompt("The result is #{result}")

  prompt(MESSAGES["another_operation"])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")
end

prompt(MESSAGES["goodbye_message"])
