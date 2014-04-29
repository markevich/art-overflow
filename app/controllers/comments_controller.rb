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
    resource = Comment.find(params[:id])
    if current_user.like(resource)
      render json: { count: resource.reload.likes_count, state: :active }
    else
      render json: { count: resource.reload.likes_count, message: 'fail', state: :inactive}
    end
  end

  def unlike
    resource = Comment.find(params[:id])
    if current_user.unlike(resource)
      render json: { count: resource.reload.likes_count, state: :inactive }
    else
      render json: { count: resource.reload.likes_count, message: 'fail', state: :active}
    end
  end

  def permitted_params
    params.require(:comment).permit(:text, :commentable_id, :commentable_type)
  end
end
