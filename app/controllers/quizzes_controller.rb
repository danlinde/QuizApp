class QuizzesController < ApplicationController
	def index
		@quizzes = Quiz.all
	end

	def show
		@quiz = Quiz.find(params[:id])
	end

	def new
		@quiz = Quiz.new
	end

	def create
		quiz = Quiz.create(params[:quiz].permit(:title))
		# question = Question.create(ask: params[:question])
		# quiz.questions << question
		redirect_to quiz_path(quiz)
		# redirect_to quiz
	end

end
