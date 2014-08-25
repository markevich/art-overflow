class AddGraphicsTypeToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :graphics_type, :string
    add_index :pictures, :graphics_type
  end
end
