class Reviewer < ActiveRecord::Base
  attr_accessible :correct_items, :items_answered, :items_attributes

  belongs_to :user
  has_many :items, :dependent => :destroy

  accepts_nested_attributes_for :items

  def update_scores (score)
    items_answered = self.items_answered + 1
    items_corrected = self.correct_items + score
    
    self.update_attributes(:items_answered => items_answered, :correct_items => items_corrected)
  end
end
