#require "pry"

class Rules
  attr_reader :moves
   
  def initialize(game_n=1)
    if game_n == 2
      @rules = {
        "rock": ["lizard", "scissors"],
        "paper": ["rock", "spock"],
        "scissors": ["paper", "lizard"],
        "lizard": ["spock", "paper"],
        "spock": ["scissors", "rock"]
      }
    else
      @rules = {
        "rock": ["scissors"],
        "scissors": ["paper"],
        "paper": ["rock"]
      }
    end
      
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
    @moves = []
    @rules.each { |k,v| @moves << k.to_s }
    @moves
  end
  
  def determine_round_winner(play1, play2)
    game_val = 0
    if play1 == play2
      game_val = 0
    else
      @rules[play1.to_sym].include?(play2) ? game_val += 1 : game_val -= 1
    end
    game_val
  end
  
end

#binding.pry