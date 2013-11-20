class AddDayAndTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :day, :date
    add_column :events, :time, :time
  end
end
