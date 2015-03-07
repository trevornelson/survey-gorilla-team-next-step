get '/survey' do
	@surveys = Survey.all
	@questions = Question.all
	@answers = Answer.all
  erb :'surveys/show'
end

post '/survey/:id' do

end

get '/partial' do
  erb :'surveys/survey_partial'
end
