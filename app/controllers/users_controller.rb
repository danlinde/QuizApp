class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(params[:user].permit(:email, :password, :password_confirmation))

		redirect_to '/users'

				# if @user.save
				# 	session[:user_id] = @user.id
				# 	redirect to('/')
				# else 
				# 	flash.now[:errors] = @user.errors.full_messages
				# 	erb :"users/new"
				# end
	end

	def index
		@user = User.last
	end

	 
end
