"Rock, Paper, Scissors!"
puts "Player 1, enter your play:"
play1 = gets.chomp.downcase
puts "Player 2, enter your play:"
play2 = gets.chomp.downcase

val = 0

if play1 == "rock"
  val +=1 if play2 == "scissors"
elsif play1 == "paper"
  val += 1 if play2 == "rock"
elsif play1 == "scissors"
  val += 1 if play2 == "paper"
else
  puts "Invalid entry: #{play1}"
end

puts val


  