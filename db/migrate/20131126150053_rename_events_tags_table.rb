class RenameEventsTagsTable < ActiveRecord::Migration
  def change
    rename_table :events_tags_tables, :events_tags
  end
end
