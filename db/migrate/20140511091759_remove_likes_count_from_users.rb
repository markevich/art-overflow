class RemoveLikesCountFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :likes_count, :integer
  end
end
