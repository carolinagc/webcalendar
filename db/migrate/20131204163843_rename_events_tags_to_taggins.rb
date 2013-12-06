class RenameEventsTagsToTaggins < ActiveRecord::Migration
  def change
    rename_table :events_tags, :taggins
  end
end
