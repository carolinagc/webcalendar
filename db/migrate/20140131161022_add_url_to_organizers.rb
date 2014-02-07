class AddUrlToOrganizers < ActiveRecord::Migration
  def change
    add_column :organizers, :url, :string
  end
end
