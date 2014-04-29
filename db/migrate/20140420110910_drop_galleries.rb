class DropGalleries < ActiveRecord::Migration
  def change
    drop_table :galleries
  end
end
