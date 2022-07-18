class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, please enter a value."
    end
    self.name = n.capitalize
  end

  def choose
    choice = nil
    loop do
      puts <<-MOVE
      \n
      Please enter the number of your choice 
        1)Rock 
        2)Paper
        3)Scissors
        4)Lizard
        5)Spock"
      MOVE
      choice = gets.chomp.to_i
      break if (1..5).to_a.include? choice
      puts "Sorry, invalid choice. Enter number between 1 - 5"
    end
    self.move = RPSGame::MOVES[choice - 1]
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', "Hal", "Chappie", "Sonny"].sample
  end

  def choose
    self.move = RPSGame::MOVES.sample
  end
end

class Move
  def win?(other)
    win_against.include?(other.move_name)
  end
end

class Paper < Move
  attr_reader :move_name, :win_against

  def initialize
    @move_name = :paper
    @win_against = [:rock, :spock]
  end
end
class Rock < Move
  attr_reader :move_name, :win_against

  def initialize
    @move_name = :rock
    @win_against = [:scissors, :lizard]
  end
end
class Scissors < Move
  attr_reader :move_name, :win_against

  def initialize
    @move_name = :scissors
    @win_against = [:paper, :lizard]
  end
end

class Lizard < Move
  attr_reader :move_name, :win_against

  def initialize
    @move_name = :lizard
    @win_against = [:paper, :spock]
  end
end

class Spock < Move
  attr_reader :move_name, :win_against

  def initialize
    @move_name = :spock
    @win_against = [:rock, :scissors]
  end
end

class RPSGame
  MOVES = [Rock.new, Paper.new, Scissors.new, Lizard.new, Spock.new]
  attr_reader :human, :computer
  attr_accessor :score

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = { human: 0, computer: 0 }
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      winner = who_won?
      tally(winner)
      display_moves
      display_win(winner)
      display_score
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def tally(winner)
    score[winner] += 1 unless winner.nil?
  end

  def display_score
    human_score = "#{human.name}: #{score[:human]} "
    computer_score = "#{computer.name}: #{score[:computer]}"

    puts "-" * 50
    puts (human_score + "     " + computer_score).center(50)
    puts "-" * 50
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n"
    end
    answer == "y"
  end

  def display_moves
    puts "#{human.name} chose #{human.move.move_name}"
    puts "#{computer.name} chose #{computer.move.move_name}"
  end

  def who_won?
    if human.move.win? computer.move
      :human
    elsif computer.move.win? human.move
      :computer
    end
  end

  def display_win(winner)
    case winner
    when :human then puts "#{human.name} won!"
    when :computer then puts "#{computer.name} won!"
    else puts "It's a tie!"
    end
  end

  def display_welcome_message
    system 'clear'
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock #{human.name.capitalize}!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  end
end

RPSGame.new.play
