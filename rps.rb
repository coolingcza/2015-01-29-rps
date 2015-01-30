require "pry"

#Rock, Paper, Scissors!

require_relative "player_class"
require_relative "game_class"


def play_game
  
  game = Game.new()
  game.start
  
  player1 = game.make_player
  player2 = game.make_player
  
  game.play_rounds(player1, player2)
  
  display_game_winner(player1,player2) if game.rounds > 1
  
end


# # Public: #determine_round_winner
# # Compares player moves to rules and determines winner.
# #
# # Parameters:
# # play1 - Player 1's move
# # play2 - Player 2's move
# # rules - rule hash from Game object
# #
# # Returns:
# # game_val - Number: 0, 1, or -1 depending on round outcome.
# #
# # State Changes:
# # game_val
#
# def determine_round_winner(play1, play2, rules)
#   game_val = 0
#   if play1 == play2
#     game_val = 0
#   else
#     play2 == rules[play1.to_sym] ? game_val += 1 : game_val -= 1
#   end
#   game_val
# end
#
# # Public: #declare_round_winner
# # Prints winner to inteface and calls winner's #won_round.
# #
# # Parameters:
# # game_val - returned from #determine_round_winner
# # player1  - Player 1 object
# # player2  - Player 2 object
# #
# # Returns:
# # Outputs winning player's name.
# #
# # State Changes:
# # None.
#
# def declare_round_winner(game_val,player1,player2)
#   if game_val == 1
#     puts "#{player1.name} wins!"
#     player1.won_round
#   elsif game_val == -1
#     puts "#{player2.name} wins!"
#     player2.won_round
#   else
#     puts "It's a tie!"
#   end
# end
#
# # Public: #play_rounds
# # Plays number of rounds stored in Game object.
# #
# # Parameters:
# # rounds  - Number: from Game object
# # player1 - Player 1 object
# # player2 - Player 2 object
# # rules   - Hash: from Game object
# #
# # Returns:
# # None.
# #
# # State Changes:
# # None.
#
# def play_rounds(rounds,player1,player2,rules)
#   rnd = 0
#
#   until rnd > rounds-1 do
#
#     play1 = player1.get_move
#     play2 = player2.get_move
#
#     game_val = determine_round_winner(play1, play2, rules)
#
#     declare_round_winner(game_val,player1,player2)
#
#     rnd += 1
#   end
# end

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