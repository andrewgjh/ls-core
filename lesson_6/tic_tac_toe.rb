require 'pry-byebug'

INITIAL_MARKER = " "
COMPUTER_MARKER = "O"
PLAYER_MARKER = "X"

def prompt(msg)
  puts "==> #{msg}"
end

def display_board(brd)
  system "clear"
  puts "           |            |"
  puts "           |            |"
  puts "     #{brd['q']}     |      #{brd['w']}     |      #{brd['e']}"
  puts "           |            |"
  puts "           |            |"
  puts "-----------+------------+------------"
  puts "           |            |"
  puts "           |            |"
  puts "     #{brd['a']}     |      #{brd['s']}     |      #{brd['d']}"
  puts "           |            |"
  puts "           |            |"
  puts "-----------+------------+------------"
  puts "           |            |"
  puts "           |            |"
  puts "     #{brd['z']}     |      #{brd['x']}     |      #{brd['c']}"
  puts "           |            |"
  puts "           |            |"
end

def intialize_bord
  new_board = {}
  %w(q w e a s d z x c).each { |square| new_board[square] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |char| brd[char] == INITIAL_MARKER }
end

def computer_plays_on!(brd)
  computer_choice = empty_squares(brd).sample
  brd[computer_choice] = COMPUTER_MARKER
end

def player_plays_on!(brd)
  choice = ""
  loop do
    prompt "Choose a square #{empty_squares(brd).join(', ')}"
    choice = gets.chomp.downcase
    break if empty_squares(brd).include?(choice)
    prompt "That is space cannot be used."
  end
  brd[choice] = PLAYER_MARKER
end

def detect_winning_row(brd)
  wins = %w(qwe asd zxc qaz wsx edc qsc zse)
  wins.select do |win|
    win_spots = win.split ""
    computer_win = win_spots.all? { |spot| brd[spot] == COMPUTER_MARKER }
    player_win = win_spots.all? { |spot| brd[spot] == PLAYER_MARKER }
    computer_win || player_win
  end
end

def display_game_status(brd, winning_row)
  display_board(brd)
  unless winning_row.empty?
    case brd[winning_row.first[0]]
    when "X" then prompt "🏆🏆🏆You Won!🏆🏆🏆"
    else prompt "😱😱😱The Computer Won😱😱😱"
    end
  else
    prompt "👔👔👔 It's a Tie Game 👔👔👔"
  end
end

loop do
  board = intialize_bord
  loop do
    display_board(board)
    player_plays_on!(board)
    computer_plays_on!(board)
    win_row = detect_winning_row(board)
    if not win_row.empty? || empty_squares(board).empty?
      display_game_status(board, win_row)
      break
    end
  end
  prompt "Play again? (y/n)"
  again = gets.chomp.downcase
  break unless again.start_with?("y")
end
