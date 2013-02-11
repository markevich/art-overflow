class UsersController < ApplicationController
  layout 'user'
  before_filter :set_model
  before_filter :check_if_signed_in, only: [:follow, :unfollow]
  def drawings
    @drawings = @user.drawings
    render layout: 'application'
  end

  def show

  end

  def follow
    current_user.follow(@user)
    render nothing: true
  end

  def unfollow
  end

  private
  def check_if_signed_in
    render(status: 401, text: 'not authorized') unless user_signed_in?
  end

  def set_model
    @user = User.find(params[:id])
  end
end
