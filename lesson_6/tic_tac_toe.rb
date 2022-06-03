require 'pry-byebug'

INITIAL_MARKER = " "
COMPUTER_MARKER = "O"
PLAYER_MARKER = "X"
WINS = %w(qwe asd zxc qaz wsx edc qsc zse)

def prompt(msg)
  puts "==> #{msg}"
end

def joinor(arr, delimiter = ", ", last_word="or")
  case arr.size
  when 1 then arr[0].to_s
  when 2 then arr.join(" #{last_word} ")
  else
    join_str = arr[0..-2].join(delimiter)
    join_str << " #{last_word} #{arr[-1]}"
    join_str
  end
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd)
  system 'clear'
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
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def intialize_bord
  new_board = {}
  %w(q w e a s d z x c).each { |square| new_board[square] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |char| brd[char] == INITIAL_MARKER }
end

def computer_plays_on!(brd)
  favourable_position = ai_offense(brd)
  vulnerable_position = ai_defence(brd)
  computer_choice = if favourable_position
                      favourable_position.split("").find do |move|
                        brd[move] == INITIAL_MARKER
                      end
                    elsif vulnerable_position
                      vulnerable_position.split("").find do |move|
                        brd[move] == INITIAL_MARKER
                      end
                    else
                      empty_squares(brd).sample
                    end
  brd[computer_choice] = COMPUTER_MARKER
end

def player_plays_on!(brd)
  choice = ""
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}"
    choice = gets.chomp.downcase
    break if empty_squares(brd).include?(choice)
    prompt "That is space cannot be used."
  end
  brd[choice] = PLAYER_MARKER
end

def ai_defence(brd)
  WINS.find do |row|
    spaces = row.split("")
    brd.values_at(*spaces).count(PLAYER_MARKER) == 2 &&
      brd.values_at(*spaces).count(INITIAL_MARKER) == 1
  end
end

def ai_offense(brd)
  WINS.find do |row|
    spaces = row.split("")
    brd.values_at(*spaces).count(COMPUTER_MARKER) == 2 &&
      brd.values_at(*spaces).count(INITIAL_MARKER) == 1
  end
end

def detect_winning_row(brd)
  WINS.find do |row|
    win_spots = row.split ""
    computer_win = win_spots.all? { |spot| brd[spot] == COMPUTER_MARKER }
    player_win = win_spots.all? { |spot| brd[spot] == PLAYER_MARKER }
    computer_win || player_win
  end
end

def who_won(brd, winning_row)
  return nil unless winning_row
  case brd[winning_row[0]]
  when COMPUTER_MARKER then "Computer"
  when PLAYER_MARKER then "Player"
  end
end

def display_game_status(brd, winning_row)
  display_board(brd)
  case who_won(brd, winning_row)
  when "Player" then prompt "🏆🏆🏆You Won!🏆🏆🏆"
  when "Computer" then prompt "😱😱😱The Computer Won😱😱😱"
  else prompt "👔👔👔 It's a Tie Game 👔👔👔"
  end
end

def scorekeeper(scoreboard, winner)
  case winner
  when "Computer" then scoreboard[:computer] += 1
  when "Player" then scoreboard[:player] += 1
  end
end

def display_score(scoreboard)
  puts <<-SCOREBOARD


  ---------------SCOREBOARD--------------------
  PLAYER: #{scoreboard[:player]} 
  
  COMPUTER: #{scoreboard[:computer]}
  ---------------------------------------------
  SCOREBOARD
end

prompt 'Welcome to Tic-Tac-Toe. First to 5 points wins the game'
sleep(1)
loop do
  score_board = { player: 0, computer: 0 }
  loop do
    board = intialize_bord
    display_score(score_board)
    loop do
      display_board(board)
      display_score(score_board)
      player_plays_on!(board)
      computer_plays_on!(board)
      win_row = detect_winning_row(board)
      if win_row || empty_squares(board).empty?
        scorekeeper(score_board, who_won(board, win_row))
        display_game_status(board, win_row)
        sleep(2)
        break
      end
    end
    if score_board.values.include?(5)
      display_score(score_board)
      break
    end
  end
  prompt "Play again? (y/n)"
  again = gets.chomp.downcase
  break unless again.start_with?("y")
end
prompt "Thanks for playing, come back soon!"
