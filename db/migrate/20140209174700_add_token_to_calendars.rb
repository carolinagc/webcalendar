class AddTokenToCalendars < ActiveRecord::Migration
  def change
    add_column :calendars, :token, :string
  end
end
