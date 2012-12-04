class AddNameAndDescriptionToDrawings < ActiveRecord::Migration
  def change
  	add_column :drawings, :name, :string
  	add_column :drawings, :description, :string
  end
end
