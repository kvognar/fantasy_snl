class CreateScoringTypes < ActiveRecord::Migration
  def change
    create_table :scoring_types do |t|
      t.string :description, null: false
      t.integer :value, null: false

      t.timestamps
    end
  end
end
