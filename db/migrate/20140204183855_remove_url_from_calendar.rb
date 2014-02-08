class RemoveUrlFromCalendar < ActiveRecord::Migration
  def change
    remove_column :calendars, :url
  end
end
