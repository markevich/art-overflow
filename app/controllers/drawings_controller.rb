#encoding: utf-8
class DrawingsController < ApplicationController
  before_filter :check_user, only: [:new, :edit, :update, :create]
  def index
    @drawings = Drawing.last(20).reverse
  end

  def show
    @drawing = Drawing.find params[:id]
    @drawing.viewed_by(current_user) if current_user
  end

  def new
    @drawing = Drawing.new
  end

  def create
    @drawing = Drawing.new(params[:drawing])
    @drawing.user = current_user

    if @drawing.save
      redirect_to edit_drawing_path(@drawing)
    else
      render action: :new
    end
  end

  def edit
    @drawing = current_user.drawings.find params[:id]
  end

  def update
    drawing = current_user.drawings.find params[:id]
    drawing.update_attributes(params[:drawing])
    redirect_to drawing_path(drawing)
  end

  private

end