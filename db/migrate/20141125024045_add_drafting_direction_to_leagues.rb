class AddDraftingDirectionToLeagues < ActiveRecord::Migration
  def change
    rename_column :leagues, :draft_order, :drafting_direction
    add_column :leagues, :current_drafter_id, :integer, default: 1, null: false
  end
end
