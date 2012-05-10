class Exam < ActiveRecord::Base
  attr_accessible :name, :description, :toPublish, :destroy_at, :questions_attributes, :choices_attributes
  has_many :questions, :dependent => :destroy
  belongs_to :admin

  acts_as_paranoid

  validates :name, :presence => true
  validates :description, :presence => true

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:question].blank? }, :allow_destroy => true

end
