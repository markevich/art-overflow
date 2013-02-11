class UsersController < ApplicationController
  layout 'user'
  before_filter :set_model
  def drawings
    @drawings = @user.drawings
    render layout: 'application'
  end

  def show

  end

  def follow
    #TODO: redirect_to authorize_path unless current_user
  end

  def unfollow
    #TODO: redirect_to authorize_path unless current_user
  end

  private
  def set_model
    @user = User.find(params[:id])
  end
end
