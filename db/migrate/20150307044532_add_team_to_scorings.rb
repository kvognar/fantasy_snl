class AddTeamToScorings < ActiveRecord::Migration
  def change
    add_column :scorings, :team_id, :integer
    add_index :scorings, :team_id
  end
end
