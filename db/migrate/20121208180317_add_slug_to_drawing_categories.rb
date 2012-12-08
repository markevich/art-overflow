class AddSlugToDrawingCategories < ActiveRecord::Migration
  def change
    add_column :drawing_categories, :slug, :string, after: :name
    add_index :drawing_categories, :slug, unique: true
  end
end
