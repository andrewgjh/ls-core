class RPSGame
  attr_reader :human, :computer
  attr_accessor :score
  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = {human: 0, computer: 0}
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
    score[winner] += 1 unless winner == nil 
  end

  def display_score
    puts "-" * 50
    puts "#{human.name}: #{score[:human]}      #{computer.name}: #{score[:computer]}".center(50)
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
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def who_won?
    if human.move > computer.move
      :human
    elsif human.move < computer.move
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
    puts "Welcome to Rock, Paper, Scissors, #{human.name.capitalize}!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

end

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
    self.move = Move.new(Move::VALUES[choice - 1])
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', "Hal", "Chappie", "Sonny"].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  attr_reader :value
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  def initialize(value)
    @value = value
  end

  def scissors?
    value == "scissors"
  end

  def rock?
    value == "rock"
  end

  def paper?
    value == "paper"
  end

  def lizard?
    value == "lizard"
  end

  def spock?
    value == "spock"
  end

   def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
    (paper? && (other_move.rock? || other_move.spock?)) ||
    (scissors? && (other_move.paper? || other_move.lizard?)) ||
    (lizard? && (other_move.paper? || other_move.spock?)) ||
    (spock? && (other_move.rock? || other_move.scissors?))
  end

  def <(other_move)
    (rock? && (other_move.spock? || other_move.paper?)) ||
    (paper? && (other_move.scissors? || other_move.lizard?)) ||
    (scissors? && (other_move.spock? || other_move.rock?)) ||
    (lizard? && (other_move.scissors? || other_move.rock?)) ||
    (spock? && (other_move.paper? || other_move.lizard?))
  end

 

  def to_s
    value
  end
end

RPSGame.new.play
