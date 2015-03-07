class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :user_surveys

  def results
  	survey_tally = {}

  	questions.each do |question|
  		survey_tally[question.id] = question.tally_results
  	end

  	return survey_tally
  end

end
