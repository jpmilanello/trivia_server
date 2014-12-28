class Question < ActiveRecord::Base
	
  	validates :description,:answer, :option1, :option2, :option3, :presence =>true
  	validates_uniqueness_of :description
end
