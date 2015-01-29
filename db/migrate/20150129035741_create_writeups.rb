class CreateWriteups < ActiveRecord::Migration
  def change
    create_table :writeups do |t|
      t.string :title
      t.text :body, null: false
      t.integer :episode_id
      t.integer :author_id, null: false
      t.timestamps
    end
    add_index :writeups, :author_id
    add_index :writeups, :episode_id, unique: true
  end
end
