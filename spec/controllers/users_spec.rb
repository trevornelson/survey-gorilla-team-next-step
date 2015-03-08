require_relative '../spec_helper'

describe 'Users Controller' do
	let(:user) {User.create(name: 'Dan Pitt', email: 'dan.pitt@gmail.com', password: 'pass12345')}

	it 'responded to a logged out get request to /users/:id route' do
		get '/users/1'
		expect(last_response).to be_redirect
		follow_redirect!
		last_request.path.should == "/"
	end

	it 'responded to a logged in get request to /users/:id route' do
		session[:user_id] = user.id
		get "/users/#{user.id}"
		expect(last_response).to be_ok
	end

end