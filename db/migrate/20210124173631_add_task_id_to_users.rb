class AddTaskIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :task_id, :bigint
  end
end
