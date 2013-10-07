require 'spec_helper'

def create_quiz(attribute)
	Quiz.create(title: 'Some quiz')
end

describe 'the quiz page' do
	it 'should display a quiz' do
		create_quiz(title: 'some quiz')
		visit '/quiz'

		expect(page).to have_content 'Some quiz'
	end
end