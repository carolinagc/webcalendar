class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.text :category
      t.text :type
      t.timestamps
    end
  end
end
