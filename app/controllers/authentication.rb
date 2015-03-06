get "/authentication/login" do
  erb :'auth/login'
end

get "/authentication/signup" do
  erb :"auth/signup"
end

post "/authentication/register_user" do
  if params[:password] == params[:password_confirm]
    user = User.new(params)
    user.save
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/?error=true'
  end

end

post "authentication/signin" do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/?error=true'
  end
end