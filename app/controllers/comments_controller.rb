class CommentsController < ApplicationController
  def create
    comment_params = permitted_params.merge(user: current_user)
    Comment.create(comment_params)
    redirect_to :back
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user.id == current_user.id
    redirect_to :back
  end

  def like
    comment = Comment.find(params[:id])
    current_user.like(comment)
    redirect_to :back
  end

  def unlike
    comment = Comment.find(params[:id])
    current_user.unlike(comment)
    redirect_to :back
  end

  def permitted_params
    params.require(:comment).permit(:text, :commentable_id, :commentable_type)
  end
end
