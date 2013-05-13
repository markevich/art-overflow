class CreateTableDrawings < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.string :path
    end
  end
end
