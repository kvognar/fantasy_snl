class AddInviteKeyToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :invite_token, :string
  end
end
