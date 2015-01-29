"Rock, Paper, Scissors!"
puts "Player 1, enter your play:"
play1 = gets.chomp.downcase
puts "Player 2, enter your play:"
play2 = gets.chomp.downcase

valid_entries = ["rock","paper","scissors"]

points_p1 = 0
points_p2 = 0

game_val = 0

v1 = valid_entries.include? play1
v2 = valid_entries.include? play2

if v1 && v2
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
    puts "Player 1 is the winner!"
  elsif game_val == -1
    puts "Player 2 is the winner!"
  else
    puts "It's a tie!"
  end
else
  if !v1 && !v2
    puts "Invalid entries."
  elsif v2
    puts "Invalid entry for Player 1"
  else
    puts "Invalid entry for Player 2"
  end
end
