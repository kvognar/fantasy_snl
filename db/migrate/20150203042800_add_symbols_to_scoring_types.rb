class AddSymbolsToScoringTypes < ActiveRecord::Migration
  def change
    add_column :scoring_types, :symbol, :string
  end
end
