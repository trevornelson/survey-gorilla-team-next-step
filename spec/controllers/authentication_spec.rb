require_relative '../spec_helper'

describe "Authentication controller"  do
  let(:user) {User.create(name: "Natalia",  email: "natalia@email.com", password: "0000")}


describe "GET '/'" do
    it "loads homepage" do
      get '/'
      expect(last_response).to be_ok
    end

    it "displays homepage content" do
      get '/'
      expect(last_response.body).to include("Welcome to Survey Gorilla!!!")
    end
end

describe 'POST /authentication/signin' do
    it 'should log in a registered user' do
      post '/authentication/signin', params={user:{email: "natalia@email.com", password: "0000"}}
      expect(last_response).to be_redirect
      follow_redirect!
      last_request.path.should == "/users/#{user.id}"
   end
  end

  describe 'POST /authentication/register_user' do
    it 'should register a user' do
      get '/authentication/register_user', params={user:{name: "Natalia", email: "natalia@email.com", password: "0000"}}
      expect(last_response).to be_redirect
      follow_redirect!
      last_request.path.should == "/users/#{user_id}"
   end

end