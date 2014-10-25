class CreateScorings < ActiveRecord::Migration
  def change
    create_table :scorings do |t|
      t.integer :actor_id, null: false
      t.integer :scoring_type_id, null: false
      t.integer :episode_id, null: false

      t.timestamps
    end
    add_index :scorings, :actor_id
    add_index :scorings, :episode_id
    add_index :scorings, :scoring_type_id
  end
end
