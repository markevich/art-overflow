class DrawingsController < ApplicationController
  before_filter :check_owner, only: [:edit, :update]
  before_filter :collect_drawing_categories, only: [:new, :edit]
  def index
    @drawings = Drawing.last(20).reverse
  end

  def show
    @drawing = Drawing.find params[:id]
  end

  def new
    @drawing = Drawing.new
  end

  def create
    @drawing = Drawing.new(params[:drawing])
    @drawing.user = current_user

    if @drawing.save
      redirect_to drawing_path(@drawing)
    else
      render action: :new
    end
  end

  def edit
    @drawing = Drawing.find params[:id]
  end

  def update
    @drawing = Drawing.find params[:id]
    @drawing.update_attributes(params[:drawing])
    redirect_to drawing_path(@drawing)
  end

  private

  def collect_drawing_categories
    @drawing_categories = DrawingCategory.all.collect {|p| [ p.name, p.id ] }
  end

  def check_owner
    unless Drawing.find(params[:id]).user == current_user
      redirect_to :back
    end
  end

end