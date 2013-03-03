class CommentsController < ApplicationController
  before_filter :set_parent, only: [:create, :list]
  def create
    @comment = Comment.build_from(@parent, current_user.id, params[:comment][:body])
    @comment.save

    list and return if request.xhr?
    redirect_to @parent
  end

  def list
    render partial: 'list', locals: {comments: @parent.comments}
  end

  private
  def set_parent
    @parent = if params[:drawing_id]
      Drawing.find(params[:drawing_id])
    end
  end
end
