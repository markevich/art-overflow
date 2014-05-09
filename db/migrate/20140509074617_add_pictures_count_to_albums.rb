class AddPicturesCountToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :pictures_count, :integer, default: 0
  end
end
