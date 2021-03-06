require 'yaml'

MESSAGES = YAML.load_file('game_messages.yml')
CARD_SUITS = ["❤️", "♦️", '♣️', "♠️"]
CARD_TYPES = [
  { name: "Ace", value: 1 },
  { name: "2", value: 2 },
  { name: "3", value: 3 },
  { name: "4", value: 4 },
  { name: "5", value: 5 },
  { name: "6", value: 6 },
  { name: "7", value: 7 },
  { name: "8", value: 8 },
  { name: "9", value: 9 },
  { name: "10", value: 10 },
  { name: "Jack", value: 10 },
  { name: "Queen", value: 10 },
  { name: "King", value: 10 }
]

def prompt(msg)
  puts "===> #{msg}"
end

def shuffled_new_deck
  standard_deck = []
  CARD_TYPES.each do |card_face|
    CARD_SUITS.each do |suit|
      fresh_card = card_face.clone
      fresh_card[:suit] = suit
      standard_deck << fresh_card
    end
  end
  standard_deck.shuffle
end

def draw_card!(deck)
  deck.pop
end

def fresh_deal(p_hand, d_hand, deck)
  2.times do
    d_hand << draw_card!(deck)
    p_hand << draw_card!(deck)
  end
end

def display_hands(p_hand, d_hand, show_all=false)
  dealers_hnd = d_hand.map.with_index do |card, idx|
    if idx == 0
      "Unknown"
    else
      "#{card[:name]}#{card[:suit]}"
    end
  end
  dealers_hnd = d_hand.map { |card| "#{card[:name]}#{card[:suit]}" } if show_all
  players_hnd = p_hand.map { |card| "#{card[:name]}#{card[:suit]}" }

  system "clear"
  prompt "Dealer has: #{dealers_hnd.join(', ')}"
  prompt "Player has: #{players_hnd.join(', ')}"
end

def add_up(hand)
  total = hand.reduce(0) { |acc, card| acc + card[:value] }
  if hand.any? { |card| card[:name] == "Ace" }
    total += 10 if (hand.size == 2) || (total - 1 <= 10)
  end
  total
end

def busted?(hand)
  add_up(hand) > 21
end

def dealers_turn!(p_hand, d_hand, deck)
  while add_up(d_hand) < 17
    sleep(1)
    d_hand << draw_card!(deck)
    sleep(1)
    display_hands(p_hand, d_hand, true)
    sleep(1)
  end
end

def players_turn!(p_hand, d_hand, deck, game_over)
  catch :player_done do
    loop do
      display_hands(p_hand, d_hand)
      prompt MESSAGES[:hit_stay]
      loop do
        action = gets.chomp.to_i
        p_hand << draw_card!(deck) if action == 1
        # 4. If player bust, dealer wins.
        game_over = true if busted?(p_hand)
        throw :player_done if action == 2 || game_over
        break if action == 1
        puts MESSAGES[:reprompt_hit_stay]
      end
    end
  end
  game_over
end

def who_won?(p_hand, d_hand)
  player_total = add_up(p_hand)
  dealer_total = add_up(d_hand)

  if busted?(d_hand)
    :dealer_bust
  elsif busted?(p_hand)
    :player_bust
  elsif player_total > dealer_total
    :player_win
  elsif dealer_total > player_total
    :dealer_win
  else
    :tie_game
  end
end

def display_results(p_hand, d_hand, outcome, scoreboard)
  display_hands(p_hand, d_hand, true)
  puts MESSAGES[:final_score]
  prompt "Dealer has #{add_up(d_hand)}"
  prompt "Player has #{add_up(p_hand)}"

  puts MESSAGES[outcome]
  puts "Total games played: #{scoreboard[:games_played]}"
  puts "Dealer has won #{scoreboard[:dealer]}/#{scoreboard[:best_of]} games"
  puts "Player has won #{scoreboard[:player]}/#{scoreboard[:best_of]} games."
end

def tally(scoreboard, outcome)
  scoreboard[:games_played] += 1
  case outcome
  when :player_bust then scoreboard[:dealer] += 1
  when :player_win then scoreboard[:player] += 1
  when :dealer_bust then scoreboard[:player] += 1
  when :dealer_win then scoreboard[:dealer] += 1
  end
end

score_board = { dealer: 0, player: 0, games_played: 0, best_of: 0 }
system 'clear'
prompt MESSAGES[:welcome_message]
gets

prompt MESSAGES[:play_times]
loop do
  score_board[:best_of] = gets.chomp.to_i
  break if score_board[:best_of] > 0
  prompt MESSAGES[:incorrect_times]
end

loop do
  # 1. Initialize game
  game_deck = shuffled_new_deck
  player_hand = []
  dealer_hand = []
  game_over = false
  best_of = score_board[:best_of]

  # 2. Deal cards to player and dealer
  fresh_deal(player_hand, dealer_hand, game_deck)

  # 3. Player turn: hit or stay
  #   - repeat until bust or "stay"
  game_over = players_turn!(player_hand, dealer_hand, game_deck, game_over)

  # 5. Dealer turn: hit or stay
  #   - repeat until total >= 17
  # 6. If dealer bust, player wins.
  dealers_turn!(player_hand, dealer_hand, game_deck) unless game_over

  # 7. Compare cards and declare winner.
  outcome = who_won?(player_hand, dealer_hand)
  tally(score_board, outcome)
  display_results(player_hand, dealer_hand, outcome, score_board)

  break if score_board[:player] == best_of || score_board[:dealer] == best_of
  prompt MESSAGES[:continue_play]
  again = gets.chomp.downcase
  break if again.start_with?("n")
end

prompt MESSAGES[:goodbye_message]
