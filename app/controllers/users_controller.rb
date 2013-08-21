class UsersController < ApplicationController
  before_filter :set_model
  before_filter :authenticate_user!, :check_self_request, only: [:follow, :stop_following]

  def show
    @following = current_user.following?(@user) if user_signed_in?
  end

  def follow
    current_user.follow(@user)
    @user.create_activity :follow
    render nothing: :true
  end

  def stop_following
    current_user.stop_following(@user)
    @user.create_activity :stop_following
    render nothing: :true
  end

  private

  def set_model
    @user = User.find(params[:id])
  end

  def check_self_request
    redirect_to action: :show if current_user == @user
  end

end
