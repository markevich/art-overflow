class AddAcceptedAtToInvite < ActiveRecord::Migration
  def change
    add_column :invites, :accepted_at, :datetime
  end
end
