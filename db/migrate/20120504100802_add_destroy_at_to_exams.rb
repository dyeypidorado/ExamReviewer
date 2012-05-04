class AddDestroyAtToExams < ActiveRecord::Migration
  def change
    add_column :exams, :deleted_at, :time
  end
end
