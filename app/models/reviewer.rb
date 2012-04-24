class Reviewer < ActiveRecord::Base
  attr_accessible :correct_items, :exam_id, :items_answered, :user_id
  
  belongs_to :user
end
