class CreateReviewers < ActiveRecord::Migration
  def change
    create_table :reviewers do |t|
      t.integer :exam_id
      t.integer :user_id
      t.integer :items_answered
      t.integer :correct_items

      t.timestamps
    end
  end
end
