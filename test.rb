puts "Enter play:"
play1=gets.chomp.downcase
avail_play = ["rock","paper","scissors"]
x=0

until avail_play.include? play1 do
  puts "Entry was not rock, paper, or scissors.  Please try again:"
  play1 = gets.chomp.downcase
  x += 1
end

if x > 2
  puts "fail"
else
  puts "success"
end

