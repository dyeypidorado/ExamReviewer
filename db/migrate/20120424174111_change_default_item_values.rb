class ChangeDefaultItemValues < ActiveRecord::Migration
  def change
    change_column_default :reviewers, :items_answered, 0
    change_column_default :reviewers, :correct_items, 0
  end
end
