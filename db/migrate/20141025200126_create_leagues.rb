class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name, null: false
      t.integer :creator_id, null: false

      t.timestamps
    end
    add_index :leagues, :creator_id
    add_index :leagues, :name
  end
end
