class AddConfirmToEvents < ActiveRecord::Migration
  def change
    add_column :events, :confirm, :boolean, :default => false
  end
end
