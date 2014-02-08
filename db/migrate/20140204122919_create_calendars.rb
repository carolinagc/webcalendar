class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :url
      t.references :user, index: true
      t.text :title

      t.timestamps
    end
  end
end
