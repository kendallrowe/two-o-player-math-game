class Question
  attr_reader :id, :question_prompt, :solution

  def initialize(prompt, solution)
    @question_prompt = prompt
    @solution = solution
  end

  def ask_question()
    puts @question_prompt

    gets.chomp.to_i == @solution
  end

end