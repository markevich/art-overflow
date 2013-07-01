class CommentsController < ApplicationController
  # Define your restrict methods and use them like this:
  #
  before_action :user_required,      except: [:index]
  # 
  # before_action :owner_required,     only: [:my, :incoming, :edit, :trash]
  # before_action :moderator_required, only: [:update, :to_published, :to_draft, :to_spam, :to_trash]

  include Concerns::TheCommentsController::Base

  # Public methods:
  #
  # [:index, :create]

  # Application side methods:
  # Overwrite following default methods if it's need
  # Following methods based on *current_user* helper method
  # Look here: https://github.com/the-teacher/the_comments/blob/master/app/controllers/concerns/the_comments_controller.rb#L62
  #
  # [:my, :incoming, :edit, :trash]

  # You must protect following methods
  # Only comments moderator (holder or admin) can invoke following actions
  #
  # [:update, :to_published, :to_draft, :to_spam, :to_trash]

  def like
    @comment = Comment.find params[:id]
    current_user.vote_for @comment
    @comment.create_activity :like
    redirect_to :back
  end

  def unlike
    @comment = Comment.find params[:id]
    current_user.unvote_for @comment
    @comment.activities.where(key: 'comment.like', owner: current_user).first.destroy
    redirect_to :back
  end

  def user_required
    unless user_signed_in?
      session[:before_redirect] = params
      render :js => "window.location = '#{new_user_session_path}'"
    end
  end

  def permitted_params
    params.require(:commentable_id).permit(:commentable_type)
  end
end
