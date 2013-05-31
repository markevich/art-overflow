class RenameInviteToPromotion < ActiveRecord::Migration
  def change
    rename_table :invites, :promotions
  end
end
