require 'spec_helper'

describe Question do
  it {should belong_to(:quiz)}
  
  it {should have_many(:answers)}
  
  it 'knows the correct answer' do
  	question = Question.create(ask: 'Capital of France')
  	wrong_answer = Answer.create(response: 'London', correctness: false)
  	right_answer = Answer.create(response: 'Paris', correctness: true)
  	question.answers << wrong_answer
  	question.answers << right_answer
  	expect(question.correct_answer).to eq right_answer
  end

end
