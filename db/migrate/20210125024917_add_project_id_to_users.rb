class AddProjectIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :project_id, :bigint
  end
end
