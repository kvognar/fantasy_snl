class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :year, null: false
      t.integer :season_number, null: false
      t.boolean :is_active, null: false, default: false
      t.timestamps
    end

    add_column :episodes, :season_id, :integer, null: false, default: 1
    add_index :episodes, :season_id

    add_column :leagues, :season_id, :integer, null: false, default: 1
    add_index :leagues, :season_id

    create_table :cast_memberships do |t|
      t.integer :actor_id, null: false
      t.integer :season_id, null: false
      t.timestamps
    end

    add_index :cast_memberships, [:actor_id, :season_id], unique: true

  end
end
