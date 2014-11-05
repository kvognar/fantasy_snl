class ChangeTeamMembershipUserToTeam < ActiveRecord::Migration
  def change
    remove_column :team_memberships, :owner_id
    add_column :team_memberships, :team_id, :integer, null: false
    add_index :team_memberships, :team_id
    add_index :team_memberships, [:team_id, :actor_id], unique: true
  end
end
