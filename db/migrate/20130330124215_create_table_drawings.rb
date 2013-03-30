class CreateTableDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :name
      t.string :path
    end
  end
end
