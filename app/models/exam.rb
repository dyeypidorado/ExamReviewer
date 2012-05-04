class Exam < ActiveRecord::Base
  attr_accessible :name, :description, :toPublish, :destroy_at
  has_many :questions, :dependent => :destroy
  belongs_to :admin

  acts_as_paranoid

  validates :name, :presence => true
  validates :description, :presence => true

end
