class QuizzesController < ApplicationController
	def index
		@quizzes = Quiz.all
	end

	def show
		@quiz = Quiz.find(params[:id])
	end

	def new
		@quiz = Quiz.new
		5.times { @quiz.questions.build }
	end

	def create
		@quiz = Quiz.new(params[:quiz].permit(:title, questions_attributes: [:ask]))
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
		if @quiz.update params[:quiz].permit(:title, questions_attributes: [:ask, :id])
			redirect_to @quiz
		else
			render 'edit'
		end
	end

	def destroy
		quiz = Quiz.find(params[:id]).destroy
		redirect_to quizzes_path
	end
end
