"Rock, Paper, Scissors!"

valid_entries = ["rock","paper","scissors"]

puts "Player 1, enter your play:"
play1 = gets.chomp.downcase

until valid_entries.include? play1 do
  puts "Entry was not rock, paper, or scissors.  Please try again:"
  play1 = gets.chomp.downcase
end

puts "Player 2, enter your play:"
play2 = gets.chomp.downcase
until valid_entries.include? play2 do
  puts "Entry was not rock, paper, or scissors.  Please try again:"
  play2 = gets.chomp.downcase
end


points_p1 = 0
points_p2 = 0

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
  puts "Player 1 is the winner!"
elsif game_val == -1
  puts "Player 2 is the winner!"
else
  puts "It's a tie!"
end

