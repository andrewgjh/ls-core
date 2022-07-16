require 'yaml'
MESSAGES = YAML.load_file('ttt_game_prompts.yml')

class Board
  WINS = %w(qwe asd zxc qaz wsx edc qsc zse)
  KEYS = %w(q w e a s d z x c)
  attr_accessor :squares

  def initialize
    reset
  end

  def reset
    @squares = {}
    KEYS.each { |key| squares[key.to_sym] = Square.new }
  end
  
  def board_state
    KEYS.map { |key| squares[key.to_sym] }
  end

  def draw
    brd = board_state
    puts "       |       |"
    puts "   #{brd[0]}   |   #{brd[1]}   |   #{brd[2]}"
    puts "       |       |"
    puts " ------+-------+------"
    puts "       |       |"
    puts "   #{brd[3]}   |   #{brd[4]}   |   #{brd[5]}"
    puts "       |       |"
    puts " ------+-------+------"
    puts "       |       |"
    puts "   #{brd[6]}   |   #{brd[7]}   |   #{brd[8]}"
    puts "       |       |"
  end
 
  def []=(key, marker)
    squares[key].marker = marker
  end

  def unmarked_keys
    squares.keys.select { |key| squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def win_row
    WINS.find do |row|
      win_spots = row.split ""
      all_marker = win_spots.map do |spot|
        squares[spot.to_sym].marker
      end
      all_marker.uniq.size == 1 && all_marker[0] != Square::INITIAL_MARKER
    end
  end

  def winning_marker
    squares[win_row[0].to_sym].marker if win_row
  end
end

class Square
  INITIAL_MARKER = " "
  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  attr_reader :name

  def initialize(marker)
    @marker = marker
    @name = ""
  end

  def name=(n)
    @name = n.capitalize
  end
end

class TTTGame
  COMPUTER_MARKER = "O"
  HUMAN_MARKER = "X"
  attr_reader :board, :human, :computer, :score

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @score = Hash.new(0)
  end

  def play
    welcome
    game_loop
    display_goodbye_message
  end

  private

  def welcome
    clear
    display_welcome_message
    puts MESSAGES[:name]
    loop do
      human.name = gets.chomp
      break unless human.name.empty?
      puts MESSAGES[:invalid_name]
    end
  end

  def game_loop
    loop do
      game_play
      tally_score
      display_result
      break unless play_again?
      board.reset
    end
  end

  def tally_score
    case board.winning_marker
    when TTTGame::HUMAN_MARKER then score[human.name] += 1
    when TTTGame::COMPUTER_MARKER then score[:computer] += 1
    end
  end

  def game_play
    loop do
      display_game_state
      human_moves
      break if board.someone_won? || board.full?
      computer_moves
      break if board.someone_won? || board.full?
    end
  end

  def play_again?
    answer = nil
    loop do
      puts MESSAGES[:play_again]
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts MESSAGES[:reprompt_play_again]
    end
    answer == "y"
  end

  def human_moves
    avail_spots = board.unmarked_keys
    puts "#{MESSAGES[:choose_move]}\n
    (#{avail_spots.join(', ')})"

    choice = nil
    loop do
      choice = gets.chomp.to_sym
      break if avail_spots.include? choice
      puts MESSAGES[:invalid_choice]
    end
    board[choice] = human.marker
  end

  def computer_moves
    avail_spots = board.unmarked_keys
    choice = avail_spots.sample
    board[choice] = computer.marker
  end



  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def display_game_state
    clear
    display_score
    board.draw
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def display_score
    puts "-" * 50
    puts "SCOREBOARD".center(50)
    player_score = "#{human.name}: #{score[human.name] || 0}      "
    computer_score = "Computer: #{score[:computer] || 0} "
    puts (player_score + computer_score).center(50)
    puts "-" * 50
  end

  def clear
    system "clear"
  end

  def display_welcome_message
    puts MESSAGES[:welcome]
  end

  def display_goodbye_message
    puts MESSAGES[:goodbye]
  end

  def display_result
    display_game_state
    case board.winning_marker
    when TTTGame::HUMAN_MARKER then puts MESSAGES[:player_win]
    when TTTGame::COMPUTER_MARKER then puts MESSAGES[:computer_win]
    else puts MESSAGES[:tie_game]
    end
  end
end

game = TTTGame.new
game.play
