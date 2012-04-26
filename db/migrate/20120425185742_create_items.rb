class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :reviewer_id
      t.integer :question_id
      t.integer :choice_id

      t.timestamps
    end
  end
end
