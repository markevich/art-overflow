class CommentsController < ApplicationController
  before_filter :set_parent, only: [:create]
  def create
    @comment = Comment.build_from(@parent, current_user.id, params[:comment][:body])
    @comment.save
    redirect_to @parent
  end

  private 
  def set_parent
    @parent = if params[:drawing_id]
      Drawing.find(params[:drawing_id])
    end
  end
end