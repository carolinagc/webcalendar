class AddResponsiblePublicToEvents < ActiveRecord::Migration
  def change
    add_column :events, :responsible, :string
    add_column :events, :public, :boolean, :default => false
  end
end
