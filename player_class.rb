class Player
  #attr
  
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
  end
  
  def check_move(@move)
    @valid_entries.include? @move
  end

end