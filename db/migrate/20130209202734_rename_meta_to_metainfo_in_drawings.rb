class RenameMetaToMetainfoInDrawings < ActiveRecord::Migration
  def change
    rename_column :drawings, :meta, :meta_info
  end
end
