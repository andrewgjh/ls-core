VALID_CHOICES = %w(rock paper scissors lizard spock)

WIN_CHART = {
  "rock" => ["scissors", "lizard"],
  "paper" => ["rock", "spock"],
  "scissors" => ["paper", "lizard"],
  "lizard" => ["paper", "spock"],
  "spock" => ["rock", "scissors"]
}
LEGEND = {
  "r" => "rock",
  "p" => "paper",
  "sc" => "scissors",
  "l" => "lizard",
  "sp" => "spock"
}

def count_score(player, computer, score_board)
  if win?(player, computer)
    score_board[:player] = score_board[:player] + 1
  elsif win?(computer, player)
    score_board[:computer] = score_board[:computer] + 1
  end
end

def test_method
  prompt("testing")
end

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  WIN_CHART[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("🏆🏆🏆You won!🏆🏆🏆")
  elsif win?(computer, player)
    prompt("👎👎👎Computer won!👎👎👎")
  else
    prompt("👔👔👔Tie game!👔👔👔")
  end
end

score_board = {
  player: 0,
  computer: 0
}

choice_prompt = <<-MSG 
Enter your choice:

r for rock
p for paper
l for lizard
sc for scissor
sp for spock
MSG

loop do
  choice = ""
  loop do
    prompt(choice_prompt)
    choice = LEGEND[gets.chomp]

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  display_results(choice, computer_choice)
  count_score(choice, computer_choice, score_board)

  prompt "You chose: #{choice} Computer chose: #{computer_choice}"
  puts "-------------SCOREBOARD-------------"
  prompt "Computer: #{score_board[:computer]} Player: #{score_board[:player]}"
  puts "------------------------------------"

  # prompt("Do you want to play again?")
  # break unless gets.chomp.downcase.start_with? 'y'
  break if (score_board[:computer] == 3) || (score_board[:player] == 3)
end

prompt("Hope you had fun. Goodbye!")
