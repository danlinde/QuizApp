class QuestionsController < ApplicationController
	def index
		@questions = Question.all
	end

	def show
		@question = Question.find(params[:id])
	end

	def new
		@question = Question.new
	end

	def create
		question = Question.create(params[:question].permit(:ask, :quiz_id))
		redirect_to question_path(question)
	end
end
