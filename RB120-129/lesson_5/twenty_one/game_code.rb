require "pry"
require 'yaml'

MESSAGES = YAML.load_file('twenty_one_game_prompts.yml')

class Participant
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def toss_cards
    @hand = []
  end

  def show_hand
    @hand.map { |card| "#{card.name} #{card.suite}" }
  end

  def hit(card)
    hand << card
  end

  def busted?
    total > 21
  end

  def total
    summed = hand.sum(&:value)
    if hand.any? { |card| card.name == "Ace" }
      summed += 10 if summed <= 11
    end
    summed
  end

  def <(other_player)
    total < other_player.total
  end

  def >(other_player)
    total > other_player.total
  end
end

class Player < Participant; end

class Dealer < Participant
  def stay
    total >= 17
  end
end

class Deck
  attr_accessor :cards

  def initialize
    shuffled_new_deck
  end

  def shuffled_new_deck
    @cards = []
    Card::FACE.each do |card_face|
      Card::SUITES.each do |suite|
        name, value = card_face.values
        cards << Card.new(name, value, suite)
      end
    end
    cards.shuffle!
  end

  def draw_card
    cards.pop
  end
end

class Card
  SUITES = ["❤️", "♦️", '♣️', "♠️"]
  FACE = [
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
  attr_reader :name, :value, :suite

  def initialize(name, value, suite)
    @name = name
    @value = value
    @suite = suite
  end
end

class Game
  attr_reader :dealer, :player, :deck, :score

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @score = { player: 0, dealer: 0 }
  end

  def start
    loop do
      starting_hands
      display_hand_gameover(false)
      player_turn
      dealer_turn unless player.busted?
      show_results
      break unless play_again?
      reset
    end
  end

  private

  def reset
    deck.shuffled_new_deck
    player.toss_cards
    dealer.toss_cards
  end

  def display_score
    puts "-" * 50
    puts "PLAYER:#{score[:player]} DEALER:#{score[:dealer]}".center(50)
    puts "-" * 50
  end

  def show_results
    winner = who_won
    tally_score(winner)
    display_hand_gameover(true)
    puts MESSAGES[winner]
  end

  def who_won
    if player.busted?
      :player_bust
    elsif dealer.busted?
      :dealer_bust
    elsif player > dealer
      :player_win
    elsif dealer > player
      :dealer_win
    else
      :tie_game
    end
  end

  def tally_score(winner)
    case winner
    when :player_win, :dealer_bust then score[:player] += 1
    when :dealer_win, :player_bust then score[:dealer] += 1
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

  def starting_hands
    2.times do
      dealer.hit(deck.draw_card)
      player.hit(deck.draw_card)
    end
  end

  def display_hand_gameover(show_all=false)
    p_hand = player.show_hand
    d_hand = dealer.show_hand
    d_hand[0] = "Unknown" unless show_all
    system 'clear'
    display_score
    puts "Dealer has:  #{d_hand.join(', ')} TOTAL #{dealer.total}"
    puts "Player has:  #{p_hand.join(', ')} TOTAL #{player.total}"
  end

  def player_turn
    until player.busted?
      puts MESSAGES[:another_card]
      choice = gets.chomp.downcase
      unless ["y", 'n'].include?(choice)
        puts MESSAGES[:invalid_choice]
        next
      end
      break if choice == "n"
      player.hit(deck.draw_card)
      display_hand_gameover(false)
    end
  end

  def dealer_turn
    loop do
      break if dealer.stay || dealer.busted?
      dealer.hit(deck.draw_card)
      display_hand_gameover(false)
      sleep(1)
    end
  end
end

Game.new.start
