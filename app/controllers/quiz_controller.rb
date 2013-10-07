class QuizController < ApplicationController
	def index
		@quizzes = Quiz.all
	end


end
