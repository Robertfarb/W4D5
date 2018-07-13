class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :goal_name, null: false
      t.string :body, null: false
      t.boolean :private, null: false

      t.timestamps
    end
  end
end
