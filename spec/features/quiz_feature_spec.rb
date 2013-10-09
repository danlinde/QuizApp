require 'spec_helper'

def create_quiz(attribute)
	Quiz.create(title: 'Some quiz')
end

describe 'the quiz page' do
	it 'should display a quiz' do
		create_quiz(title: 'some quiz')
		visit '/quizzes'

		expect(page).to have_content 'Some quiz'
	end
end

describe 'an individual quiz' do
	it 'has its own page' do
		create_quiz(title: 'some quiz')
		visit '/quizzes'
		click_link "Some quiz"
		expect(page).to have_css 'h2', text: 'Some quiz'
	end
end

describe 'new quiz form' do
	it 'creates a new quiz' do
		visit '/quizzes/new'
		within '.new_quiz' do
			fill_in "Title", with: 'Brand new quiz'
			click_button "Create Quiz"
		end
		expect(page).to have_content("Brand new quiz")
	end
end
