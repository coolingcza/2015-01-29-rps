require "pry"

"Rock, Paper, Scissors!"

class Player
  attr_reader :name
  
  def initialize(name)
    @name = name
    @valid_entries = ["rock","paper","scissors"]
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

end

def play_game
  puts "Enter first player's name:"
  player1 = Player.new(gets.chomp)
  puts "Enter second player's name:"
  player2 = Player.new(gets.chomp)
  
  play1 = player1.get_move
  play2 = player2.get_move
  

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
  # declare winner:
  if game_val == 1
    puts "#{player1.name} is the winner!"
  elsif game_val == -1
    puts "#{player2.name} is the winner!"
  else
    puts "It's a tie!"
  end
  
end

binding.pry

