class AddCounterCachesForLikeable < ActiveRecord::Migration
  def change
    add_column :pictures, :likes_count, :integer, default: 0
  end
end
