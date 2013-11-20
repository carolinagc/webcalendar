class ChangeTypeFormatInEvents < ActiveRecord::Migration
  def up
    change_column :events, :type, :string
  end
  def down
    change_column :events, :type, :text
  end

end
