class AddFirstNameLastNameNicknameToUser < ActiveRecord::Migration
  def change
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
  end
end
