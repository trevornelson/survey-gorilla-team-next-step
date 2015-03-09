3.times do
  user = User.create(name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: "12345")
  5.times do
    survey = user.surveys.create(title: Faker::Lorem.word)
    6.times do
      question = survey.questions.create(text: Faker::Lorem.sentence + "?")
      3.times do
        question.choices.create(text: Faker::Lorem.word)
      end
    end
  end
end

Survey.all.each do |survey|
  40.times do
    survey_user = User.create(name: Faker::Name.name,
                              email: Faker::Internet.email,
                              password: Faker::Internet.password)

    SurveyUser.create(user_id: survey_user.id, survey_id: survey.id)

    survey.questions.each do |question|
      choice_ids = question.choices.map { |choice| choice.id }
      Answer.create(question_id: question.id, choice_id: choice_ids.sample)
    end

  end

end
