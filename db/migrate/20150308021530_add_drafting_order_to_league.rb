class AddDraftingOrderToLeague < ActiveRecord::Migration
  def change
    remove_column :league_memberships, :ord, :integer
    add_column :leagues, :drafting_order, :text, array: true, default: []
  end
end
