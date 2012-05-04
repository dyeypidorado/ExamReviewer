class AddDescriptionToExam < ActiveRecord::Migration
  def change
    add_column :exams, :description, :text, :default => "Add your description here."
  end
end
