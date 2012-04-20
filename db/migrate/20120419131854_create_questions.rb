class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.int :exam_id
      t.string :question

      t.timestamps
    end
  end
end
