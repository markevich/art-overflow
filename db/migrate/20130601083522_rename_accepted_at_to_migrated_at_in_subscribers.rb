class RenameAcceptedAtToMigratedAtInSubscribers < ActiveRecord::Migration
  def change
    rename_column :subscribers, :accepted_at, :invited_at
  end
end
