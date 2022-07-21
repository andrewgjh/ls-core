class GuessingGame
  
  def initialize(starting,ending)
    @current_guess = nil
    @range = (starting..ending)
    @max_guesses = Math.log2(ending-starting).to_i + 1
  end

  def play
    p @number = rand(range)
    @guesses = @max_guesses
    loop do
      guess_a_num  
      self.guesses -= 1
      puts display_guess_result
      break if guesses == 0 || correct_guess?
    end
    display_game_stat
  end

  private
  attr_accessor :guesses, :current_guess
  attr_reader :number, :range

  def display_game_stat
    if correct_guess?
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"  
    end
  end

  def correct_guess?
    number == current_guess
  end

  def display_guess_result
    if current_guess < number
      "Your guess is too low.
      "
    elsif current_guess > number
      "Your guess is too high.
      "
    else
      "That's the number.
      "
    end
  end

  def guess_a_num
    puts "You have #{guesses} guesses remaining."
    print "Enter a number between #{range.first} and #{range.last}: "
    loop do
      @current_guess = gets.chomp.to_i
      break if range === current_guess
      print "Invalid guess. Enter a number between #{range.first} and #{range.last}: "
    end
  end

end

game = GuessingGame.new(501,1500)
game.play
