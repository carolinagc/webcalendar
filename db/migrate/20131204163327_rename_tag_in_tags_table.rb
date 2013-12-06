class RenameTagInTagsTable < ActiveRecord::Migration
  def change
    rename_column :tags, :tag, :name
  end
end
