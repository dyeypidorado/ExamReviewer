class Question < ActiveRecord::Base
  attr_accessible :question, :choices_attributes
  
  has_many :choices, :dependent => :destroy
  belongs_to :exam
  
  validates :question, :presence => true 
  
  accepts_nested_attributes_for :choices, :reject_if => lambda { |a| a[:choice].blank? }, :allow_destroy => true
end
