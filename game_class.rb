require_relative "rules_class"

# Class: Game
#
# Models a Rock, Paper, Scissors game.
#
# Attributes:
# @rules  - Hash: contains available moves as keys and m.
# @rounds - Integer: initialized at zero, increases as rounds are won.
# @moves  - Array: contains strings of valid moves derived from @rules.
#
# Public Methods:
# #get_rounds
# #print_rules
# #get_valid_moves
# #determine_round_winner
# #declare_round_winner
# #play_rounds

class Game
  attr_reader :rounds, :moves, :rules
  
  def initialize(game_num)
    @game_n = game_num
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
    #print_rules
    #get_valid_moves
    @rules = Rules.new(@game_n)
    @rules.print_rules
    @moves = @rules.get_valid_moves
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

  def play_rounds(player1,player2,rules)
    rnd = 0
  
    until rnd > @rounds-1 do
  
      play1 = player1.get_move
      play2 = player2.get_move
  
      game_val = rules.determine_round_winner(play1, play2)
    
      declare_round_winner(game_val,player1,player2)
    
      rnd += 1
    end
  end

end