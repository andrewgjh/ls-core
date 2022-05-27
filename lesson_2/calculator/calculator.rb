require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def valid_number?(num)
  Integer(num)
rescue StandardError
  false
end

def operation_to_message(op)
  word = case op
         when "1"
           messages("word_add",lang)
         when "2"
           messages("word_subtract",lang)
         when "3"
           messages("word_multiply",lang)
         when "4"
           messages("word_divide",lang)
         end
  word
end

num1 = ""
lang = "es"
prompt(messages("welcome",lang))
name = ""
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(messages('valid_name',lang))
  else
    break
  end
end

prompt("#{messages('greetings',lang)} #{name}")
loop do # main loop
  loop do
    prompt(messages("first_number",lang))
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt(messages("valid_number",lang))
    end
  end

  num2 = ""
  loop do
    prompt(messages("second_number",lang))
    num2 = Kernel.gets().chomp().to_i()
    if valid_number?(num2)
      break
    else
      prompt(messages("valid_number",lang))
    end
  end

  prompt(messages("operator_prompt",lang))
  operator = ""
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages("operator_valid"),lang)
    end
  end

  prompt("#{operation_to_message(operator)} #{messages('operator_message_two_nums', lang)}")

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

  prompt(messages("another_operation",lang))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")
end

prompt(messages("goodbye_message",lang))
