class AddMembershipsCountToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :memberships_count, :int, null: false
  end
end
