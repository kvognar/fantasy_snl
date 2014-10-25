class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.date :air_date, null: false
      t.integer :episode_number

      t.timestamps
    end
    add_index :episodes, :air_date
  end
end
