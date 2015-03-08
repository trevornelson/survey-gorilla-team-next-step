require_relative '../spec_helper'

describe 'Survey Model' do
	before(:all) do
		survey = Survey.create(user_id: 20000, title: 'My newer survey')
		@question = survey.questions.create(text: 'Whats your favorite food?')
		@choice1 = @question.choices.create(text: 'pizza')
		@choice2 = @question.choices.create(text: 'macaroni')
		@choice3 = @question.choices.create(text: 'steak')
		5.times { @choice1.answers.create(question_id: @question.id) }
		9.times { @choice2.answers.create(question_id: @question.id) }
	end

	it '#tally_results method outputs hash with a key for each choice' do
		expect(@question.tally_results.keys.length).to eq(3)
	end

	it '#tally_results method outputs a count of the answers for each choice' do
		expect(@question.tally_results['macaroni']).to eq(9)
	end

	it 'Includes choices with zero corresponding answers' do
		expect(@question.tally_results['steak']).to eq(0)
	end

end