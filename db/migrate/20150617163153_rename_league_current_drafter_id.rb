class RenameLeagueCurrentDrafterId < ActiveRecord::Migration
  def change
    rename_column :leagues, :current_drafter_id, :current_drafter_index
  end
end
