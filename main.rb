require './question'
require'./player'


test_question = Question.new("What is 5 times 5?", 25)

puts "Test:"
puts test_question.ask_question()