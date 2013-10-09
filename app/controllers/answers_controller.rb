class AnswersController < ApplicationController
	def new
		@answer = Answer.new
		@question = Question.find params[:question_id]
	end

	def create
		answer = Answer.create(params[:answer].permit(:response, :question_id, :correctness))
		redirect_to question_path(answer.question)
	end

end
