class AddCommentsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :comment_id, :integer
    add_index :users, :comment_id
  end
end
