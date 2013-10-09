require 'spec_helper'


def create_question(attribute)
	Question.create(attribute)
end

describe 'the answer page' do 

before(:each) do
	create_question(ask: 'some question')
	visit '/questions'
	click_link 'some question'
end

	it 'should prompt user to answer a question' do
		expect(page).to have_link 'Create Answer'	
	end

	it 'should allow user to answer a question' do
		click_link "Create Answer"
		fill_in "Response",:with => "some answer"
		click_button "Create Answer"
		expect(page).to have_content("some answer")
	end

	it 'should allow user to select a correct answer' do
		click_link "Create Answer"
		fill_in "Response",:with => "some answer"
		check "Correctness"
		click_button "Create Answer"
		expect(page).to have_content("true")
	end

end