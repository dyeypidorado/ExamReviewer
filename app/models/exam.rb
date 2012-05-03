class Exam < ActiveRecord::Base
  attr_accessible :name

  has_many :questions, :dependent => :destroy

  belongs_to :admin
end
