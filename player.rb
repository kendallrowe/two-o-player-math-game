class Player
  attr_accessor :current_lives, :id
  @@number_of_players = 0

  def initialize()
    @lives = MAX_LIVES
    @@number_of_players += 1
    @id = @@number_of_players
  end

private

MAX_LIVES = 3

end