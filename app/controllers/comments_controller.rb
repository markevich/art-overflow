class CommentsController < ApplicationController
  def like
    comment = Comment.find params[:id]
    ActiveRecord::Base.transaction do
      current_user.vote_for comment
      new_votes_count = comment.votes_for
      comment.update_attributes(likes_count: new_votes_count)
      comment.create_activity :like
    end
    redirect_to :back
  end

  def unlike
    comment = Comment.find params[:id]
    ActiveRecord::Base.transaction do
      current_user.unvote_for comment
      new_votes_count = comment.votes_for
      comment.update_attributes(likes_count: new_votes_count)
      comment.activities.find_by(key: 'comment.like', owner: current_user).destroy
    end
    redirect_to :back
  end

  def permitted_params
    params.require(:commentable_id).permit(:commentable_type)
  end
end
