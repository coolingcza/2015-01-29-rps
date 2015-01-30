require "pry"

#Rock, Paper, Scissors!

#require_relative "player_class"

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
  attr_reader :name, :score, :move, #:valid_entries-->uncomment for testing

  def initialize(name,moves)
    @name = name
    @valid_entries = moves
    @score = 0
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

# Class: Game
#
# Models a Rock, Paper, Scissors game.
#
# Attributes:
# @rules  - Hash: contains available moves as keys and m.
# @rounds - Integer: initialized at zero, increases as rounds are won.
#
# Public Methods:
# #get_rounds
# #print_rules

class Game
  attr_reader :rules, :rounds, :moves
  
  def initialize
    @rules = {
      "rock": "scissors",
      "scissors": "paper",
      "paper": "rock"
    }
    @rounds = 0
    @moves = []
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
  
  # Public: #print_rules
  # Displays rules to user.
  #
  # Parameters:
  # None
  #
  # Returns:
  # Prints rules to command line interface.
  #
  # State Changes:
  # None
  
  def print_rules
    puts "Each of two players chooses a move from among"
    @rules.each { |k, v| puts k.capitalize }
    puts " "
    @rules.each { |k, v| puts "#{k.capitalize} beats #{v}" }
    puts " "
  end
  
  def get_valid_moves
    @rules.each { |k,v| @moves << k.to_s }
  end
  
end

def play_game
  
  game = game_setup
  
  player1 = make_player(game.moves)
  player2 = make_player(game.moves)
  
  play_rounds(game.rounds, player1, player2, game.rules)
  
  display_game_winner(player1,player2) if game.rounds > 1
  
end

# Public: #game_setup
# Instantiates a Game object.
#
# Parameters:
# None
#
# Returns:
# Game object.
#
# State Changes:
# None.

def game_setup
  game = Game.new
  game.get_rounds
  game.print_rules
  game.get_valid_moves
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

def make_player(moves)
  puts "Enter player name:"
  Player.new(gets.chomp, moves)
end

# Public: #determine_round_winner
# Compares player moves to rules and determines winner.
#
# Parameters:
# play1 - Player 1's move
# play2 - Player 2's move
# rules - rule hash from Game object
#
# Returns:
# game_val - Number: 0, 1, or -1 depending on round outcome.
#
# State Changes:
# game_val

def determine_round_winner(play1, play2, rules)
  game_val = 0
  if play1 == play2
    game_val = 0
  else
    play2 == rules[play1.to_sym] ? game_val += 1 : game_val -= 1
  end
  game_val
end

# Public: #declare_round_winner
# Prints winner to inteface and calls winner's #won_round.
#
# Parameters:
# game_val - returned from #determine_round_winner
# player1  - Player 1 object
# player2  - Player 2 object
#
# Returns:
# Outputs winning player's name.
#
# State Changes:
# None.

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

# Public: #play_rounds
# Plays number of rounds stored in Game object.
#
# Parameters:
# rounds  - Number: from Game object
# player1 - Player 1 object
# player2 - Player 2 object
# rules   - Hash: from Game object
#
# Returns:
# None.
#
# State Changes:
# None.

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

# Public: #determine_game_winner
# Determines and displays overall winner by comparing player scores.
#
# Parameters:
# player1 - Player 1 object
# player2 - Player 2 object
#
# Returns:
# Prints winner name to interface.
#
# State Changes:
# None.

def determine_game_winner(player1,player2)
  if player1.score > player2.score
    puts "#{player1.name} is the winner!"
  elsif player1.score < player2.score
    puts "#{player2.name} is the winner!"
  else
    puts "It's a tie."
  end
end

# Public: #display_player_scores
# Displays player scores.
#
# Parameters:
# player1 - Player 1 object
# player2 - Player 2 object
#
# Returns:
# Prints player scores to interface.
#
# State Changes:
# None.

def display_player_scores(player1,player2)
  puts "#{player1.name}'s score: #{player1.score}"
  puts "#{player2.name}'s score: #{player2.score}"
end

# Public: #display_game_winner
# Displays game result.
#
# Parameters:
# player1 - Player 1 object
# player2 - Player 2 object
#
# Returns:
# None.
#
# State Changes:
# None.

def display_game_winner(player1,player2)
  display_player_scores(player1,player2)
  determine_game_winner(player1,player2)
end
  

binding.pry