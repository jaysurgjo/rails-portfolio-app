class AddUserIdToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :user_id, :bigint
  end
end
