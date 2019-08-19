class Question
  attr_reader :question_prompt, :solutions

  def initialize(prompt, solution)
    @question_prompt = prompt
    @solution = solution
  end

  def ask_question(player_id)
    puts "Player #{player_id}: #{@question_prompt}"

    print "Player #{player_id}: "
    gets.chomp.to_i == @solution
  end

end