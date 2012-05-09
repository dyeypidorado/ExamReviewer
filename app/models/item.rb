class Item < ActiveRecord::Base
  belongs_to :choice
  belongs_to :question
  belongs_to :reviewer
  
  def check_answer
    if Choice.is_correct?(self.choice_id) 
      Reviewer.find(self.reviewer_id).update_scores (1)
    else
      Reviewer.find(self.reviewer_id).update_scores (0)
    end
  end
end
