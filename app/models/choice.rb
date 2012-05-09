class Choice < ActiveRecord::Base
  attr_accessible :choice, :isCorrect
  
  belongs_to :question
  has_many :items
  
  def self.is_correct? (id)
    return (self.find(id)).isCorrect
  end
  
end
