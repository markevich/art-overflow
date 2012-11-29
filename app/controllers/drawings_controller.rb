class DrawingsController < ApplicationController
  before_filter :check_owner, only: [:edit]
  def index
    @user = User.find(params[:user_id])
    @drawings = @user.drawings
  end
  def new
    @drawing = Drawing.new
  end
  def create
    @drawing = Drawing.new.tap do |d|
       d.path = params[:drawing][:path]
       d.user = current_user
    end

    if @drawing.save
      redirect_to edit_drawing_path(@drawing)
    else
      render action: :new
    end
  end
  def edit
    @drawing = Drawing.find params[:id]
  end
  private
  def check_owner
    unless Drawing.find(params[:id]).user == current_user
      redirect_to :back
    end
  end
end