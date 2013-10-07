require 'bcrypt'

class User < ActiveRecord::Base

	attr_reader :password
	attr_accessor :password_confirmation

	validates :email, uniqueness: true#, message: "This email is already taken"
	validates :password, confirmation: true#, message: "Sorry, your passwords don't match"

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	# def self.authenticate(email, password)
	# 	user = first(:email => email)
	# 	if user && BCrypt::Password.new(user.password_digest) == password
	# 		user
	# 	else
	# 		nil
	# 	end
	# end
end
