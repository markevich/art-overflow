class AddAlbumIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :album_id, :string
    add_index :pictures, :album_id
  end
end
