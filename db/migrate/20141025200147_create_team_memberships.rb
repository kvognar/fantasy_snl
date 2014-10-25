class CreateTeamMemberships < ActiveRecord::Migration
  def change
    create_table :team_memberships do |t|
      t.integer :actor_id, null: false
      t.integer :owner_id, null: false

      t.timestamps
    end
    add_index :team_memberships, :actor_id
    add_index :team_memberships, :owner_id
    add_index :team_memberships, [:actor_id, :owner_id], unique: true
  end
end
