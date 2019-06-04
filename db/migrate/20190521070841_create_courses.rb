class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :prerequisite
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :courses, [:user_id, :created_at]
  end
end
