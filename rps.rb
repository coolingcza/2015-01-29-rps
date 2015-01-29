require "pry"

"Rock, Paper, Scissors!"

class Player
  attr_reader :name, :score, :move
  
  def initialize(name)
    @name = name
    @valid_entries = ["rock","paper","scissors"]
    @score = 0
  end
  
  def get_move
    puts "#{@name}, enter rock, paper, or scissors:"
    @move = gets.chomp.downcase
    until check_move(@move) do
      puts "Entry was not rock, paper, or scissors.  Please try again:"
      @move = gets.chomp.downcase
    end
    @move
  end
  
  def check_move(move)
    @valid_entries.include? move
  end
  
  def won_round
    @score += 1
  end
    

end

def play_game
  
  rounds = get_rounds
  
  player1 = make_player
  player2 = make_player
  
  play_rounds(rounds, player1, player2)
  
  display_game_winner(player1,player2) if rounds > 1
  
  # if rounds > 1
  #
  #   display_player_scores(player1,player2)
  #   determine_game_winner(player1,player2)
  #
  # else
  # end
  
end

def get_rounds
  puts "How many rounds?"
  gets.chomp.to_i
end

def make_player
  puts "Enter player name:"
  Player.new(gets.chomp)
end

def determine_round_winner(play1, play2)
  game_val = 0
  if play1 == play2
    game_val = 0
  else
    if play1 == "rock"
      play2 == "scissors" ? game_val += 1 : game_val -= 1
    elsif play1 == "paper"
      play2 == "rock" ? game_val += 1 : game_val -= 1
    else
      play2 == "paper" ? game_val += 1 : game_val -= 1
    end
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

def play_rounds(rounds,player1,player2)
  rnd = 0
  
  until rnd > rounds-1 do
  
    play1 = player1.get_move
    play2 = player2.get_move
  
    game_val = determine_round_winner(play1, play2)
    
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

