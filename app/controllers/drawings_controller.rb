class DrawingsController < ApplicationController
  def index
    @drawings = Drawing.all
  end

  def new
    @drawing = Drawing.new
  end

  def show
     @drawing = Drawing.find(params[:id])
  end

  def create
    drawing = Drawing.create permitted_params.drawing
    redirect_to drawing
  end

end
