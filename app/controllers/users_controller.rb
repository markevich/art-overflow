class UsersController < ApplicationController
  before_filter :set_model
  before_filter :authenticate_user!, :check_self_request, only: [:follow, :stop_following]

  def follow
    current_user.follow(@user)
    @user.create_activity :follow
    redirect_to action: :show
  end

  def stop_following
    current_user.stop_following(@user)
    @user.activities.where(key: 'user.follow', owner: current_user).first.destroy
    redirect_to action: :show
  end

  private

  def set_model
    @user = User.find(params[:id])
  end

  def check_self_request
    redirect_to action: :show if current_user == @user
  end
end
