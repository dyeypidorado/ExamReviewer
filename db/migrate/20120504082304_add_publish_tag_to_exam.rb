class AddPublishTagToExam < ActiveRecord::Migration
  def change
    add_column :exams, :toPublish, :boolean, :default => 0
  end
end
