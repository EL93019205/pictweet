class ChangeNicknameToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :nickname, :string, limit: 6
  end
end
