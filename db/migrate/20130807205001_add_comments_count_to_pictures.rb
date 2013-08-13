class AddCommentsCountToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :comments_count, :integer, default: 0
  end
end
