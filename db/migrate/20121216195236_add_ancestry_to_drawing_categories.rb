class AddAncestryToDrawingCategories < ActiveRecord::Migration
  def change
    add_column :drawing_categories, :ancestry, :string
    add_index :drawing_categories, :ancestry
  end
end
