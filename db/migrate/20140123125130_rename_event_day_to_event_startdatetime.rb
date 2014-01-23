class RenameEventDayToEventStartdatetime < ActiveRecord::Migration
  def change
  	rename_column :events, :day, :startdatetime
  end
end
