class Question < ActiveRecord::Base
  attr_accessible :question
  
  has_many :choices, :dependent => :destroy
  belongs_to :exam
  
  accepts_nested_attributes_for :choices, :reject_if => lambda { |a| a[:choice].blank? }
end
