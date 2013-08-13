class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false
      t.text :text, null: false
      t.integer :likes_count, default: 0
      t.timestamps
    end
  end
end
