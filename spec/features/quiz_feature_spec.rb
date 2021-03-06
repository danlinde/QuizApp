require 'spec_helper'

def create_quiz
	Quiz.create(title: 'Some quiz').questions.create(ask: 'some question')
end

describe 'the quiz page' do
	it 'should display a quiz' do
		create_quiz
		visit '/quizzes'

		expect(page).to have_content 'Some quiz'
	end
end

describe 'an individual quiz' do
	before(:each) do
		create_quiz
		visit '/quizzes'
		click_link "Some quiz"
	end

	it 'has its own page' do
		expect(page).to have_css 'h2', text: 'Some quiz'
		expect(page).to have_css 'p', text: 'some question'

	end

	it 'can be edited' do
		click_link "Edit quiz"
		fill_in "Title", with: "Renamed quiz"
		click_button "Update Quiz"
		expect(page).to have_css 'h2', text: "Renamed quiz"
	end

	it 'can be deleted' do
		click_button "delete"
		expect(page).not_to have_content 'Some quiz'
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

	it 'should not accept a new quiz without a title' do
		visit '/quizzes/new'
			click_button 'Create Quiz'
			expect(page).to have_content 'error'
	end
end

describe 'creating a new quiz' do
	before(:each) do
		visit '/quizzes/new'
		fill_in "Title", with: "Quiz title"
		fill_in "Question", with: "What is your name?", :match => :first
	end

	it 'can also create a new question' do
		click_button 'Create Quiz'
		expect(page).to have_content "What is your name?"
		expect(Quiz.last.questions).not_to be_empty
	end

	it 'can also add an answer to a new question' do
		fill_in "Answer", with: "the answer", :match => :first
		click_button 'Create Quiz'
		expect(page).to have_content "the answer"
	end
end
