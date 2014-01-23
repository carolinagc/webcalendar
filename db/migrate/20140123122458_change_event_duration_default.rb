class ChangeEventDurationDefault < ActiveRecord::Migration
  def change
  	change_column :events, :duration, :integer, :default => 3600, :null => false
  end
end
