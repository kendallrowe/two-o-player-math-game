class Game 
  attr_reader :player1, :player2, :questions, :questions_remaining
  attr_accessor :winner, :draw, :current_question, :turn

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @turn = 0
    @questions = 
    [
      Question.new("What is 5 times 5?", 25),
      Question.new("What does 5 plus 3 equal?", 8),
      Question.new("What is 60 times 5?", 300),
      Question.new("What is 10 plus 23", 33),
      Question.new("What is 47 times 9", 423)
    ]
    @questions_remaining = @questions
    self.play_game
  end

  def play_game
    players = [@player1, @player2]
    while !@winner && !@draw
      take_turn(players[@turn % 2])
      puts "P1: #{@player1.current_lives}/#{Player::MAX_LIVES} vs P2: #{@player2.current_lives}/#{Player::MAX_LIVES}"
      self.turn += 1
    end
  end

  def take_turn(player)
    find_question_to_ask
    if !@current_question
      puts "----- YOU SURVIVED ALL -----"
      puts "----- THE QUESTIONS -----"
      puts "----- YOU ARE AMAZING -----"
      if @player1.current_lives == @player2.current_lives 
        draw_game_over
        self.draw = true
      else 
        self.winner = @player1.current_lives > @player2.current_lives ? @player1 : @player2
        winner_game_over
      end
    else 
      puts "---- NEW TURN -----"
      correct_answer = @current_question.ask_question(player.id)
      if !correct_answer
        player.lose_life
        puts "Player #{player.id}: Seriously? No!"
        if player.current_lives == 0
          self.winner = player
          winner_game_over
        end
      else
        puts "Player #{player.id}: YES! You are correct."
      end
    end
  end

  def find_question_to_ask
    self.current_question = @questions_remaining.sample
    @questions_remaining.delete(@current_question)
  end

  private

  def winner_game_over 
    puts "----- WINNER -----"
    puts ""
    puts "----- PLAYER ##{@winner.id} -----"
    puts ""
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def draw_game_over 
    puts ""
    puts "----- IT'S A DRAW -----"
    puts ""
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

end