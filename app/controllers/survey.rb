get '/partial' do
  erb :'surveys/survey_partial'
end

get '/surveys/results.json' do
	content_type :json
	survey = Survey.find(params[:survey_id])
	survey.results.to_json
end

get '/surveys/refresh.json' do
	erb :'users/_survey_statistics', :layout => false, :locals => {survey: Survey.find(params[:survey_id])}
end

get '/surveys/:id' do
	@survey = Survey.find(params[:id])
	@questions = Question.all
	@answers = Answer.all
	@choices = Choice.all
	erb :'surveys/show'
end

post '/survey/:id' do

end
