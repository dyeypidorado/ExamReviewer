class AddAnswerTagToItems < ActiveRecord::Migration
  def change
    add_column :items, :isAnswered, :boolean, :default => 0
  end
end
