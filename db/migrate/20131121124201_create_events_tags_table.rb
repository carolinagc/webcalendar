class CreateEventsTagsTable < ActiveRecord::Migration
  def up
    create_table :events_tags_tables do |t|
      t.integer :event_id
      t.integer :tag_id
    end
    def down
      drop_table :events_tags_tables
    end
  end
end
