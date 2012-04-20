class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.int :admin_id
      t.string :name

      t.timestamps
    end
  end
end
