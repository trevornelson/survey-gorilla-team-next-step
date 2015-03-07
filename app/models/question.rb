class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices

  def tally_results
  	results = {}

  	choices.each do |choice|
  		results[choice.id] = choice.answers.length
  	end

  	return results
  end
end
