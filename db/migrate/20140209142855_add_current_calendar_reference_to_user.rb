class AddCurrentCalendarReferenceToUser < ActiveRecord::Migration
  def change
    add_reference :users, :current_calendar, index: true, references: :calendars
  end
end
