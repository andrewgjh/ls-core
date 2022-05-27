require 'yaml'

MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')


def prompt(message)
  puts "=> #{message}"
end

def message(message)
  MESSAGES[message]
end

def valid_number?(num_str)
  num_str.to_i.to_s == num_str || num_str.to_f.to_s == num_str
end

def query_num_loop(message_prompt)
  query_var = ""
  loop do
    prompt(message(message_prompt))
    query_var = gets.chomp
    if valid_number?(query_var)
      break
    else
      prompt(message(:valid_number))
    end
  end
  query_var
end

prompt(message(:welcome_message))

loop do
  loan_amount = query_num_loop(:query_loan_amount).to_i
  apr = query_num_loop(:query_apr).to_f
  loan_duration = query_num_loop(:query_duration).to_i

  duration_months = loan_duration * 12
  monthly_interest_rate = (apr / 100) / 12

  monthly_payment = loan_amount * (monthly_interest_rate / \
  (1 - (1 + monthly_interest_rate)**(-duration_months)))

  prompt(message(:monthly_payment) + \
  "$#{monthly_payment.round(2)} for the next #{duration_months} months.")
  prompt(message(:restart))
  break if gets.chomp.downcase != 'y'
end
