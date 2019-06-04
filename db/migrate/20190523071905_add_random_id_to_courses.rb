class AddRandomIdToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :random_id, :string 
    add_index :courses, :random_id, {unique: true}
    
    Course.find_each do |e|
      e.update(random_id: SecureRandom.uuid)
    end
  end
end
