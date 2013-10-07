require 'spec_helper'

describe User do
  	it "should sign up" do
		lambda { sign_up }.should change(User, :count).by(1)
		expect(page).to have_content("Welcome, alice@example.com")
		expect(User.first.email).to eq("alice@example.com")
	end

	it 'should display a user sign up form' do
		visit '/user/new'
		
		expect(page).to have_content 'Please sign up'
	end	

	# it "should not allow user to sign up with a password that doesn't match" do
	# 	lambda { sign_up('a@a.com', 'pass', 'wrong') }.should change(User, :count).by(0)
	# 	expect(current_path).to eq('/users')
	# 	expect(page).to have_content("doesn't match confirmation")
	# end

	# it "should not allow a user to sign up with an email that is already registered" do
	# 	lambda { sign_up }.should change(User, :count).by(1)
	# 	lambda { sign_up }.should change(User, :count).by(0)
	# 	expect(page).to have_content("has already been taken")
	# end

end


# def sign_in(email, password)
# 	visit '/sessions/new'
# 	fill_in :email, :with => email
# 	fill_in :password, :with => password
# 	click_button "Sign in"
# end

def sign_up(email = "alice@example.com", password = "oranges!", password_confirmation = "oranges!")
	visit '/user/new'
	fill_in :email, :with => email
	fill_in :password, :with => password
	fill_in :password_confirmation, :with => password_confirmation
	click_button "Sign up"
end
