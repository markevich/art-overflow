class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.integer :user_id
      t.string :path

      t.timestamps
    end
  end
end
