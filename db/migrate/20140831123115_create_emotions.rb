class CreateEmotions < ActiveRecord::Migration
  def change
    create_table :emotions do |t|
      t.string :type
      t.integer :picture_id
      t.integer :user_id

      t.timestamps
    end
    add_index :emotions, :picture_id
    add_index :emotions, :type
  end
end
