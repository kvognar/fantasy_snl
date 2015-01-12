class AddAuthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_hash, :string, null: false
    add_column :users, :session_token, :string, null: false
    add_column :users, :is_admin, :boolean, null:false, default: false
  end
end
