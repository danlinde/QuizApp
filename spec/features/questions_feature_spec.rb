require 'spec_helper'

def create_question(attribute)
	Question.create(title: 'Some question')
end

describe 'the question page' do
	it 'should display a question' do
		create_question(title: 'some question')
		visit '/questions'

		expect(page).to have_content 'Some question'
	end
end

describe 'an individual question' do
	it 'has its own page' do
		create_question(title: 'some question')
		visit '/questions'
		click_link "Some question"
		expect(page).to have_css 'h2', text: 'Some question'
	end
end

describe 'new question form' do
	it 'creates a new question' do
		visit '/quizzes/new'
		within '.new_quiz' do
			fill_in "Title", with: 'Brand new question'
			click_button "Create question"
		end
		expect(page).to have_content("Brand new question")
	end
end