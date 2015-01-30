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
