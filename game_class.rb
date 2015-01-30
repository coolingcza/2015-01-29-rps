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
  
  # Public: #start
  # Calls methods to set up a game object.
  #
  # Parameters:
  # None
  #
  # Returns:
  # None.
  #
  # State Changes:
  # None.

  def start
    get_rounds
    print_rules
    get_valid_moves
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

  def make_player
    puts "Enter player name:"
    Player.new(gets.chomp, @moves)
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

  def determine_round_winner(play1, play2)
    game_val = 0
    if play1 == play2
      game_val = 0
    else
      play2 == @rules[play1.to_sym] ? game_val += 1 : game_val -= 1
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

  def play_rounds(player1,player2)
    rnd = 0
  
    until rnd > @rounds-1 do
  
      play1 = player1.get_move
      play2 = player2.get_move
  
      game_val = determine_round_winner(play1, play2)
    
      declare_round_winner(game_val,player1,player2)
    
      rnd += 1
    end
  end

end