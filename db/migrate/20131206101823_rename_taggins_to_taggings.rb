class RenameTagginsToTaggings < ActiveRecord::Migration
  def change
    rename_table :taggins, :taggings
  end
end
