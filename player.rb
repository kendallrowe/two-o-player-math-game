class Player
  attr_reader :id
  attr_accessor :current_lives
  @@number_of_players = 0

  def initialize
    @current_lives = MAX_LIVES
    @@number_of_players += 1
    @id = @@number_of_players
  end

  def lose_life
    self.current_lives -= 1
  end

  private

  MAX_LIVES = 3

end