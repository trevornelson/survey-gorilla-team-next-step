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
