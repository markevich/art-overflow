class DrawingCategoriesController < ApplicationController

	def show
		@category = DrawingCategory.find(params[:id]) if params[:id]
	end

end