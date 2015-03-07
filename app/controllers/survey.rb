get '/surveys/:id' do
	@survey = Survey.find(params[:id])
	@questions = Question.all
	@answers = Answer.all
	@choices = Choice.all
	erb :'surveys/show'
end

post '/survey/:id' do

end

get '/partial' do
  erb :'surveys/survey_partial'
end

get '/surveys/results.json' do
	content_type :json
	survey = Survey.find(params[:survey_id])
	survey.results.to_json
end
