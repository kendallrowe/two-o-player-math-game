class Game 
  attr_reader :winner, :player1, :player2, :current_question, :questions, :questions_remaining

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @questions = 
    [
      Question.new("What is 5 times 5?", 25),
      Question.new("What does 5 plus 3 equal?", 8),
      Question.new("What is 60 times 5?", 300)
    ]
    @questions_remaining = @questions
    self.play_game
  end

  def play_game
    while !@winner
      self.take_turn(@player1)
      @winner = @player1
    end
  end

  def take_turn(player)
    puts "---- NEW TURN -----"
    puts "Player #{player.id}: #{find_question_to_ask.ask_question}"
  end

  def find_question_to_ask
    @current_question = @questions_remaining.sample
    @questions_remaining.delete(@current_question)
    @current_question
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