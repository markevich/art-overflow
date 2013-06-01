class UsersController < ApplicationController
  before_filter :set_model
  before_filter :check_if_signed_in, :check_self_request, only: [:follow, :stop_following]

  def follow
    current_user.follow(@user)
    redirect_to action: :show
  end

  def stop_following
    current_user.stop_following(@user)
    redirect_to action: :show
  end

  private

  def check_if_signed_in
  	render(status: 401, text: 'not authorized') unless user_signed_in?  		
  end

  def set_model
    @user = User.find(params[:id])
  end

  def check_self_request
    redirect_to action: :show if current_user == @user
  end
end
