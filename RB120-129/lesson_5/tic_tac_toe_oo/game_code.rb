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

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
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
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

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

  def initialize(name, mark)
    @name = name
    @marker = mark
  end

  def name=(n)
    @name = n.capitalize
  end
end

class Human < Player
end

class Computer < Player
  AI_NAMES = ['CP30', 'R2D2', 'Voldemort', "Skylink"]
  def against_who
    puts MESSAGES[:which_computer]
    opponent = nil
    loop do
      opponent = gets.chomp.to_i
      break if (1..AI_NAMES.size).to_a.include?(opponent)
      puts MESSAGES[:invalid_computer]
    end
    @name = AI_NAMES[opponent - 1]
  end

  def makes_choice(board)
    favourable_row = ai(board, true)
    vulnerable_row = ai(board, false)
    choice = case name
             when 'R2D2' then choose_open_space(vulnerable_row,board) if vulnerable_row
             when 'Voldemort' then choose_open_space(favourable_row,board) if favourable_row
             when "Skylink"
               if favourable_row
                 choose_open_space(favourable_row,board)
               elsif vulnerable_row
                 choose_open_space(vulnerable_row,board)
               end
             end
    choice ||= center_or_random(board)
    board[choice] = marker
  end

  def center_or_random(board)
    if board.squares[:s].marker == Square::INITIAL_MARKER
      :s
    else
      board.unmarked_keys.sample
    end
  end

  def choose_open_space(row, board)
    row.chars.find do |spot|
      board.squares[spot.to_sym].marker == Square::INITIAL_MARKER
    end.to_sym
  end

  def ai(brd, attack=true)
    Board::WINS.find do |row|
      spaces = row.chars.map(&:to_sym)
      marked = brd.squares.values_at(*spaces).count do |square|
        attack ? marker_offence?(square) : marker_defence?(square)
      end
      empty = brd.squares.values_at(*spaces).count do |square|
        square.marker == Square::INITIAL_MARKER
      end
      marked == 2 && empty == 1
    end
  end

  def marker_defence?(square)
    (square.marker != marker) &&
      (square.marker != Square::INITIAL_MARKER)
  end

  def marker_offence?(square)
    square.marker == marker
  end
end

class TTTGame
  O_MARKER = "O"
  X_MARKER = "X"
  attr_reader :board, :human, :computer, :score
  attr_accessor :computer_turn

  def initialize
    name, mark = welcome
    computer_mark = mark == X_MARKER ? O_MARKER : X_MARKER
    @board = Board.new
    @human = Human.new(name, mark)
    @computer = Computer.new("", computer_mark)
    @score = Hash.new(0)
    random_start
    computer.against_who
  end

  def play
    main_game
    display_goodbye_message
  end

  private

  def random_start
    @computer_turn = [true, false].sample
  end

  def name
    puts MESSAGES[:name]
    name = nil
    loop do
      name = gets.chomp
      break unless name.empty?
      puts MESSAGES[:invalid_name]
    end
    name
  end

  def welcome
    clear
    display_welcome_message
    [name, mark]
  end

  def mark
    puts MESSAGES[:mark]
    mark = nil
    loop do
      mark = gets.chomp.upcase
      break if mark.size == 1
      puts MESSAGES[:invalid_mark]
    end
    mark
   end

  def main_game
    loop do
      game_play
      tally_score
      display_result
      break unless play_again?
      game_reset
    end
  end

  def game_reset
    board.reset
    random_start
  end

  def tally_score
    case board.winning_marker
    when human.marker then score[human.name] += 1
    when computer.marker then score[:computer] += 1
    end
  end

  def each_turn
    if computer_turn
      computer_moves
      self.computer_turn = false
    else
      human_moves
      self.computer_turn = true
    end
  end

  def game_play
    loop do
      display_game_state
      each_turn
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
    puts "#{MESSAGES[:choose_move]}
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
    sleep(1)
    computer.makes_choice(board)
  end

  def display_game_state
    clear
    display_score
    puts "#{computer_turn ? "Computer's" : "Player's"} turn."
    board.draw
  end

  def display_score
    puts "-" * 50
    puts "SCOREBOARD".center(50)
    player_score = "#{human.name}: #{score[human.name] || 0}      "
    computer_score = "#{computer.name}: #{score[:computer] || 0} "
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
    when human.marker then puts MESSAGES[:player_win]
    when computer.marker then puts MESSAGES[:computer_win]
    else puts MESSAGES[:tie_game]
    end
  end
end

game = TTTGame.new
game.play
