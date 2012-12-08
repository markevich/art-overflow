class DrawingCategoriesController < ApplicationController
  def drawings
    @category = DrawingCategory.find(params[:id])
    @drawings = @category.drawings
  end
end