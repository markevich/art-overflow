class CreateDrawingCategories < ActiveRecord::Migration
  def change
    create_table :drawing_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
