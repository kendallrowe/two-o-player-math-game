class Game 
  attr_reader :winner, :player1, :player2

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    self.play_game
  end

  def play_game
    
  end

  private

  def game_over 
    puts "----- WINNER -----"
    puts ""
    puts "----- PLAYER #{winner} -----"
    puts ""
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

end