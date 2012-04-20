class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :question_id
      t.string :choice
      t.boolean :isCorrect

      t.timestamps
    end
  end
end
