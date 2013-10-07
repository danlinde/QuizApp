require 'spec_helper'

describe "user model" do

	 it 'should have the password' do
		user = User.new
	 	user.password = 'hello1'
	 	expect(user.password_digest).to_not be_nil
	 end
end