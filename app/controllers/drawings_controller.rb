class DrawingsController < ApplicationController
  def index
    @drawings = Drawing.all
  end

  def new
    @drawing = Drawing.new
  end

  def create
    Drawing.create drawing_params
  end

  private
  def drawing_params
    params.require(:drawing).permit(:name, :path)
  end
end
