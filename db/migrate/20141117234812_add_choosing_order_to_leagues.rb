class AddChoosingOrderToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :locked, :boolean, null: false, default: false
    add_column :leagues, :drafting, :boolean, null: false, default: false
    add_column :leagues, :draft_order, :int, null: false, default: 1
    add_column :team_memberships, :ord, :int 
  end
end
