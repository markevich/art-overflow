class RenameDrawingsToPictures < ActiveRecord::Migration
  def change
    rename_table :pictures, :pictures
  end
end
