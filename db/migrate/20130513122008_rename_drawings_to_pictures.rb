class RenameDrawingsToPictures < ActiveRecord::Migration
  def change
    rename_table :picture, :picture
  end
end
