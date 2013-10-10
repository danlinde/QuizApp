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
		@quiz = Quiz.new(params[:quiz].permit(:title))
		if @quiz.save
			redirect_to quiz_path(@quiz)
		else
			render 'new'
		end
	end

	def edit
		@quiz = Quiz.find params[:id]
	end

	def update
		@quiz = Quiz.find params[:id]
		if @quiz.update params[:quiz].permit(:title)
			redirect_to @quiz
		else
			render 'edit'
		end
	end

end
