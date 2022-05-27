VALID_CHOICES = %w(rock paper scissors)

def test_method
  prompt("testing")
end

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("Tie game!")
  end
end

loop do
  choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  display_results(choice, computer_choice)

  puts "You chose: #{choice} Computer chose: #{computer_choice}"

  prompt("Do you want to play again?")
  break unless gets.chomp.downcase.start_with? 'y'
end

prompt("Hope you had fun. Goodbye!")
