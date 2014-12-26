class Question < ActiveRecord::Base
	attr_accessible :description, :answer, :option1, :option2, :option3, :option4

  	validates :description,:answer, :option1, :option2, :option3, :option4, :presence =>true
  	validates_uniqueness_of :description
end
