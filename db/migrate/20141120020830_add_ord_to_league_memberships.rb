class AddOrdToLeagueMemberships < ActiveRecord::Migration
  def change
    add_column :league_memberships, :ord, :int
    remove_column :team_memberships, :ord
  end
end
