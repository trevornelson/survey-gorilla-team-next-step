require_relative '../spec_helper'

describe 'Survey Model' do
	before(:all) do
		@survey = Survey.create(user_id: 10000, title: 'My new survey')
		@question = @survey.questions.create(text: 'Whats your favorite color?')
		@choice1 = @question.choices.create(text: 'green')
		@choice2 = @question.choices.create(text: 'red')
		@choice3 = @question.choices.create(text: 'blue')
		3.times { @choice1.answers.create(question_id: @question.id) }
		7.times { @choice2.answers.create(question_id: @question.id) }
	end

	it '#results method outputs hash with the related question ids as keys' do
		expect(@survey.results[@question.id]).not_to eq(nil)
	end

	it '#results method outputs hash with correct number of choices as keys' do
		expect(@survey.results[@question.id].length).to eq(3)
	end

	it '#results method outputs a count of the answers for each choice' do
		expect(@survey.results[@question.id]['green']).to eq(3)
	end

	it 'Includes choices with zero corresponding answers' do
		expect(@survey.results[@question.id]['blue']).to eq(0)
	end

end