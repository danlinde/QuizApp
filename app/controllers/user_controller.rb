class UserController < ApplicationController
	def create
		@user = User.create(:email => params[:email],
							:password => params[:password],
							:password_confirmation => params[:password_confirmation])
				
		@user.save

				# if @user.save
				# 	session[:user_id] = @user.id
				# 	redirect to('/')
				# else 
				# 	flash.now[:errors] = @user.errors.full_messages
				# 	erb :"users/new"
				# end
	end

	 
end
