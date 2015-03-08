

post "/authentication/register_user" do
  if params[:password] == params[:password_confirm]
    user = User.new(name: params[:name], email: params[:email], password: params[:password])
    user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/?error=true'
  end

end

post "/authentication/signin" do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/?error=true'
  end
end


get "/authentication/logout" do
  session[:user_id] = nil
  redirect '/'
end

