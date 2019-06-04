class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name

      t.timestamps
    end

    add_column :courses, :location_id, :integer
    add_index :courses, :location_id
  end
end
