class RemoveActiveAdmi < ActiveRecord::Migration
  def change
    drop_table :active_admin_comments
    drop_table :admin_users
    drop_table :rails_admin_histories
    drop_table :votes
  end
end
