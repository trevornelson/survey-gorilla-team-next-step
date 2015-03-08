require_relative '../spec_helper'

describe 'Survey Model' do
	let(:user) { User.create(name: 'Jordan Brodess', email: 'j_brod@email.com', password: '12345') }
	let(:survey) { user.surveys.create(title: 'My new survey') }

	it 


end