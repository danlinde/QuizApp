require 'spec_helper'

def create_question(attribute)
	Question.create(attribute)
end

describe 'the question page' do
	it 'should display a question' do
		create_question(ask: 'some question')
		visit '/questions'

		expect(page).to have_content 'some question'
	end
end

describe 'an individual question' do
	it 'has its own page' do
		create_question(ask: 'some question')
		visit '/questions'
		click_link "some question"
		expect(page).to have_css 'h2', text: 'some question'
	end
end

describe 'new question form' do
	it 'creates a new question' do
		visit '/questions/new'
		within '.new_question' do
			fill_in "Ask", with: 'Brand new question'
			fill_in "Answer", with: true
			click_button "Create Question"
		end
		expect(page).to have_content("Brand new question")
		expect(page).to have_content("t")
	end
end