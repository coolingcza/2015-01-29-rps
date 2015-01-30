require "pry"

#Rock, Paper, Scissors!

# Class: Player
#
# Models a player for Rock, Paper, Scissors.
#
# Attributes:
# @name          - String: player's name.
# @score         - Integer: initialized at zero, increases as rounds are won.
# @move          - String: "rock","paper", or "scissors".
# @valid_entries - Array: contains strings of valid moves.
#
# Public Methods:
# #get_move
# #check_move
# #won_round

class Player
  attr_reader :name, :score, :move
  
  def initialize(name,rules)
    @name = name
    @rules = rules
    @valid_entries = []
    @score = 0
    rules.keys.each { |a| @valid_entries << a.to_s }
  end
  
  # Public: #get_move
  # Gets player's move and checks validity.
  #
  # Parameters:
  # None.
  #
  # Returns:
  # @move
  #
  # State Changes:
  # Assigns @move.
  
  def get_move
    puts "#{@name}, enter your move:"
    @move = gets.chomp.downcase
    until check_move(@move) do
      puts "Entry was not valid.  Please try again:"
      @move = gets.chomp.downcase
    end
    @move
  end
  
  # Public: #check_move
  # Checks validity of @move entered in #get_move.
  #
  # Parameters:
  # @move
  #
  # Returns:
  # Boolean
  #
  # State Changes:
  # none.
  
  def check_move(move)
    @valid_entries.include? move
  end
  
  # Public: #won_round
  # Increases player score by one.
  #
  # Parameters:
  # None
  #
  # Returns:
  # @score
  #
  # State Changes:
  # @score value increased by one.
  
  def won_round
    @score += 1
  end
    
end

class Game
  attr_reader :rules, :rounds
  
  def initialize
    @rules = {
      "rock": "scissors",
      "scissors": "paper",
      "paper": "rock"
    }
    @rounds = 0
  end
  
  # Public: #get_rounds
  # Acquires number of rounds to be played.
  #
  # Parameters:
  # None
  #
  # Returns:
  # user input
  #
  # State Changes:
  # None

  def get_rounds
    puts "How many rounds?"
    @rounds = gets.chomp.to_i
  end
  
  def print_rules
    puts "Each of two players chooses a move from among"
    @rules.each { |k, v| puts k.capitalize }
    puts " "
    @rules.each { |k, v| puts "#{k.capitalize} beats #{v}" }
    puts " "
  end
  
end

def play_game
  
  game = game_setup
  
  player1 = make_player(game.rules)
  player2 = make_player(game.rules)
  
  play_rounds(game.rounds, player1, player2, game.rules)
  
  display_game_winner(player1,player2) if game.rounds > 1
  
end

def game_setup
  game = Game.new
  game.get_rounds
  game.print_rules
  game
end

# Public: #make_player
# Creates an instance of the Player class.
#
# Parameters:
# Acquires instance name from user.
#
# Returns:
# Player instance
#
# State Changes:
# None

def make_player(rules)
  puts "Enter player name:"
  Player.new(gets.chomp, rules)
end

# Public: #determine_round_winner
# 
#
# Parameters:
# 
#
# Returns:
# 
#
# State Changes:
# 

def determine_round_winner(play1, play2, rules)
  puts rules
  puts play1
  puts rules[play1.to_sym]
  puts play2
  puts rules[play2.to_sym]
  game_val = 0
  if play1 == play2
    game_val = 0
  else
    play2 == rules[play1.to_sym] ? game_val += 1 : game_val -= 1
    #   play2 == "scissors" ? game_val += 1 : game_val -= 1
    # elsif play1 == "paper"
    #   play2 == "rock" ? game_val += 1 : game_val -= 1
    # else
    #   play2 == "paper" ? game_val += 1 : game_val -= 1
    # end
  end
  game_val
end

def declare_round_winner(game_val,player1,player2)
  if game_val == 1
    puts "#{player1.name} wins!"
    player1.won_round
  elsif game_val == -1
    puts "#{player2.name} wins!"
    player2.won_round
  else
    puts "It's a tie!"
  end
end

def play_rounds(rounds,player1,player2,rules)
  rnd = 0
  
  until rnd > rounds-1 do
  
    play1 = player1.get_move
    play2 = player2.get_move
  
    game_val = determine_round_winner(play1, play2, rules)
    
    declare_round_winner(game_val,player1,player2)
    
    rnd += 1
  end
end

def determine_game_winner(player1,player2)
  if player1.score > player2.score
    puts "#{player1.name} is the winner!"
  elsif player1.score < player2.score
    puts "#{player2.name} is the winner!"
  else
    puts "It's a tie."
  end
end

def display_player_scores(player1,player2)
  puts "#{player1.name}'s score: #{player1.score}"
  puts "#{player2.name}'s score: #{player2.score}"
end

def display_game_winner(player1,player2)
  display_player_scores(player1,player2)
  determine_game_winner(player1,player2)
end
  

binding.pry