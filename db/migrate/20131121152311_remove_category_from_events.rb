class RemoveCategoryFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :category, :text
  end
end
