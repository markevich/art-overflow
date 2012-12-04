class AddDrawingCategoryIdToDrawings < ActiveRecord::Migration
  def change
  	add_column :drawings, :drawing_category_id, :integer
  end
end
