class AddNumberToVote < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :number, :integer
  end
end
