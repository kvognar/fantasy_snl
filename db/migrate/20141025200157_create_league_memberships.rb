class CreateLeagueMemberships < ActiveRecord::Migration
  def change
    create_table :league_memberships do |t|
      t.integer :member_id, null: false
      t.integer :league_id, null: false

      t.timestamps
    end
    add_index :league_memberships, :member_id
    add_index :league_memberships, :league_id
    add_index :league_memberships, [:member_id, :league_id], unique: true
  end
end
