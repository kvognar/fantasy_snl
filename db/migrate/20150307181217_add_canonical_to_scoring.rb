class AddCanonicalToScoring < ActiveRecord::Migration
  def change
    add_column :scorings, :canonical_id, :integer
    add_index :scorings, :canonical_id
  end
end
