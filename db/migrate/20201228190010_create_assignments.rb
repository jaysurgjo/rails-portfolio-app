class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :tasks, index: true
      t.boolean :request_accepted, default: false, null: false
      t.timestamps null: false
    end
  end
end
