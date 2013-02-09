class AddMetaToDrawings < ActiveRecord::Migration
  def change
    add_column :drawings, :meta, :string
  end
end
