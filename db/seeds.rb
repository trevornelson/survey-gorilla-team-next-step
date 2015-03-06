3.times do
  user = User.create(name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: Faker::Internet.password)
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

Survey.all.each do |s|
  40.times do
    survey_user = User.create(name: Faker::Name.name,
                              email: Faker::Internet.email,
                              password: Faker::Internet.password)

    SurveyUser.create(user_id: survey_user.id, survey_id: s.id)

    s.questions.each do |q|
      answer = Random.rand(1..3)
      Answer.create(question_id: q.id, choice_id: answer)
    end

  end

end
