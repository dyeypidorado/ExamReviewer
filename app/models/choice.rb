class Choice < ActiveRecord::Base
  attr_accessible :choice, :isCorrect
  
  belongs_to :question
end
