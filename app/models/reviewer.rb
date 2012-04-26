class Reviewer < ActiveRecord::Base
  attr_accessible :correct_items, :exam_id, :items_answered, :user_id
  
  belongs_to :user
  has_many :items
  
  accepts_nested_attributes_for :items
end
