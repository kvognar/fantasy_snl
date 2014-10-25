class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name, null: false
      t.string :image_url

      t.timestamps
    end
    add_index :actors, :name
  end
end
