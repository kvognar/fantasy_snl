class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :owner_id, null: false
      t.integer :league_id, null: false

      t.timestamps
    end
    add_index :teams, :name
    add_index :teams, :owner_id
    add_index :teams, :league_id
  end
end
