class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :facts
      t.text :comments
      t.timestamps
    end
  end
end
