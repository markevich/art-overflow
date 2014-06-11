class AddViewCountToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :view_count, :integer, default: 0
    Picture.update_all(view_count: 0)
  end
end
