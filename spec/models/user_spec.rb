require_relative '../spec_helper'

describe 'User Model' do
	let(:valid_user) { User.new(name: 'Sandi Metz', email: 'validemail@gmail.com' ,password: 'ruby12345' ) }
	let(:invalid_email_user) { User.new(name: 'Johny Appleseed', email: 'notanemailaddress' ,password: 'ruby12345' ) }
	let(:invalid_name_user) { User.new(email: 'someemail@gmail.com' ,password: 'ruby12345' ) }
	let(:invalid_password_user) { User.new(name: 'Walter White', email: 'validemail@gmail.com') }

	it 'saved a valid user to the database' do
		valid_user.save
		saved_user = User.find_by(name: 'Sandi Metz')
		expect(saved_user.email).to eq('validemail@gmail.com')
	end

	it 'rejected a user with an invalid email address' do
		invalid_email_user.save
		saved_user = User.find_by(name: 'Johny Appleseed')
		expect(saved_user).to eq(nil)
	end

	it 'rejected a user with no name' do
		invalid_email_user.save
		saved_user = User.find_by(email: 'someemail@gmail.com')
		expect(saved_user).to eq(nil)
	end

	it 'rejected a user with no password' do
		invalid_email_user.save
		saved_user = User.find_by(name: 'Walter White')
		expect(saved_user).to eq(nil)
	end

	it 'encrypted a valid users password' do
		saved_user = User.find_by(name: 'Sandi Metz')
		expect(saved_user.password_digest).not_to eq('ruby12345')
	end


end