class AddDefaultToTeamMembershipsCount < ActiveRecord::Migration
  def change
    change_column :teams, :memberships_count, :integer, default: 0
  end
end
