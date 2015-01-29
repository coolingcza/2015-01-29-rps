require "pry"

"Rock, Paper, Scissors!"

class Player
  attr_reader :name
  attr_reader :score
  
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
  
  puts "How many rounds?"
  rounds = gets.chomp.to_i
  
  puts "Enter first player's name:"
  player1 = Player.new(gets.chomp)
  puts "Enter second player's name:"
  player2 = Player.new(gets.chomp)
  
  rnd = 0
  
  until rnd > rounds-1 do
  
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
      puts "#{player1.name} wins!"
      player1.won_round
    elsif game_val == -1
      puts "#{player2.name} wins!"
      player2.won_round
    else
      puts "It's a tie!"
    end
    
    rnd += 1
  end
  
  if rounds > 1
  
    puts "#{player1.name}'s score: #{player1.score}"
    puts "#{player2.name}'s score: #{player2.score}"
  
    if player1.score > player2.score
      puts "#{player1.name} is the winner!"
    elsif player1.score < player2.score
      puts "#{player2.name} is the winner!"
    else
      puts "It's a tie."
    end
    
  else
  end
  
end

binding.pry

