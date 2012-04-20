class Question < ActiveRecord::Base
  attr_accessible :question
  
  has_many :choices
  belongs_to :exam
end
