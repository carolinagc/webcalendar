class RemoveTime < ActiveRecord::Migration
  def change
    remove_column :events, :time, :time
  end
end
