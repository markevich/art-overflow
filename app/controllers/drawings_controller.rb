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
    @drawing = Drawing.new(drawing_params)
    @drawing.user = current_user
    @drawing.save
  end

  def edit
    @drawing = current_user.drawings.find params[:id]
  end

  def update
    @drawing = current_user.drawings.find params[:id]
    if @drawing.update_attributes(drawing_params)
      redirect_to drawing_path(@drawing)
    else
      render(action: :edit)
    end
  end

  def like
    @drawing = Drawing.find params[:drawing_id]
    current_user.vote_for @drawing
    render nothing: true
  end

  def unlike
    @drawing = Drawing.find params[:drawing_id]
    current_user.unvote_for @drawing
    render nothing: true
  end

  private

  def drawing_params
    params.require(:drawing).permit(:path, :name, :tag_list, :drawing_category_id)
  end
end