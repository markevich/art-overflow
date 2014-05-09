class AddAlbumsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :albums_count, :integer, default: 0
  end
end
