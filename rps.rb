require "pry"

#Rock, Paper, Scissors!

require_relative "player_class"
require_relative "game_class"


def play_game
  
  puts "Which game would you like to play?"
  puts "1. Rock, Paper, Scissors"
  puts "2. Rock, Paper, Scissors, Lizard, Spock"
  puts "Enter game number:"
  game_num = gets.chomp.to_i
  
  game = Game.new(game_num)
  game.start
  
  player1 = make_player(game.moves)
  player2 = make_player(game.moves)
  
  game.play_rounds(player1, player2, game.rules)
  
  display_game_winner(player1,player2) if game.rounds > 1
  
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