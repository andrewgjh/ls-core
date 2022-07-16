class Board
  attr_reader :grid
  def initialize
    @grid = {
      q: " ",
      w: " ",
      e: " ",
      a: " ",
      s: " ",
      d: " ",
      z: " ",
      x: " ",
      c: " "
    }
  end
  def [](sym)
    grid[sym]
  end
end

# class Square
#   def initialize
#   end
# end

class Player
  def initialize
  end

  def mark
    
  end
end

class TTTGame
  attr_reader :board
  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new
  end
  def play
    display_welcome_message
    loop do
      display_board(board)
      break
      # first_player_moves
      # break if someone_won? || board_full?

      # second_player_moves
      # break if someone_won? || board_full?
    end
    # display_result
    display_goodbye_message
  end

  def display_board(brd)
    puts "         |         |"
    puts "    #{brd[:q]}    |    #{brd[:w]}    |     #{brd[:e]}"
    puts "         |         |"
    puts "---------+---------+----------"
    puts "         |         |"
    puts "    #{brd[:a]}    |    #{brd[:s]}    |     #{brd[:d]}"
    puts "         |         |"
    puts "---------+---------+----------"
    puts "         |         |"
    puts "    #{brd[:z]}    |    #{brd[:x]}    |     #{brd[:c]}"
    puts "         |         |"
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!\n"
  end
  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe!\n"
  end
end

game = TTTGame.new
game.play