class RenamePromotionToSubscriber < ActiveRecord::Migration
  def change
    rename_table :promotions, :subscribers
  end
end
