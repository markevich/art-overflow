class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :city, :string
    add_column :users, :vk, :string
    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end
