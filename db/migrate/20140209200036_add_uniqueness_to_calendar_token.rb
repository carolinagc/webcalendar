class AddUniquenessToCalendarToken < ActiveRecord::Migration
  def change
    add_index :calendars, :token, unique: true
  end
end
