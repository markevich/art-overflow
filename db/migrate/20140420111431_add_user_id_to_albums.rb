class AddUserIdToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :user_id, :integer
    add_index :albums, :user_id
    add_column :albums, :name, :string
  end
end
