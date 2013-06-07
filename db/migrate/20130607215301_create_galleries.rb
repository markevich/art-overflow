class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.integer :user_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
