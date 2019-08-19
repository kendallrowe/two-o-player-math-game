class Question
  attr_reader :question_prompt, :solutions

  def initialize(prompt, solution)
    @question_prompt = prompt
    @solution = solution
  end

  def ask_question
    puts @question_prompt

    gets.chomp.to_i == @solution
  end

end