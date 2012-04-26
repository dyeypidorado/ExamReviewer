class Item < ActiveRecord::Base
  attr_accessible :question_id, :choice_id, :reviewer_id

  belongs_to :reviewer
end
