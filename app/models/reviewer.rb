class Reviewer < ActiveRecord::Base
  attr_accessible :correct_items, :exam_id, :items_answered, :user_id, :items_attributes

  belongs_to :user
  has_many :items, :dependent => :destroy

  accepts_nested_attributes_for :items

  def check_scores
    items_answered = 0
    items_corrected = 0
    items = self.items.all

    items.each do |item|
      if item.choice_id != nil
        items_answered += 1
        choice = Choice.find(item.choice_id)
        if choice.isCorrect?
          items_corrected += 1
        end
      end
    end

    self.update_attributes(:items_answered => items_answered, :correct_items => items_corrected)
  end
end
