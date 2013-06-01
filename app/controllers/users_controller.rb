class UsersController < ApplicationController
  before_filter :authorize, :except => [:show]

  def show
    @user = User.find(params[:id])
  end

  def authorize
  	redirect_to(action: :show) unless current_user  		
  end

  def follow
    user = User.find(params[:id])
    if current_user == user
      redirect_to action: :show
      return
    end
    current_user.follow(user)

    redirect_to action: :show
  end

  def stop_following
    user = User.find(params[:id])
    if current_user == user
      redirect_to action: :show
      return
    end
    current_user.stop_following(user)

    redirect_to action: :show
  end
end
