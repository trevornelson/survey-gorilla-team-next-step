get '/survey' do
  erb :'surveys/show'
end

post '/survey/:id' do

end

get '/partial' do
  erb :'surveys/survey_partial'
end
