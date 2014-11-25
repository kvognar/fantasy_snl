class AddHostToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :host, :string, null: false
    add_index :episodes, :host
  end
end
