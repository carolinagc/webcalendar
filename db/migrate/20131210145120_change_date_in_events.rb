class ChangeDateInEvents < ActiveRecord::Migration
  def change
    change_column :events, :day, :datetime
  end
end
