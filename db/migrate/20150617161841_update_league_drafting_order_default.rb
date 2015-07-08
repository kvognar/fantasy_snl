class UpdateLeagueDraftingOrderDefault < ActiveRecord::Migration
  def change
    change_column_default :leagues, :drafting_direction, 0
  end
end
