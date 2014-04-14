class UsersController < ApplicationController
  before_filter :set_model
  before_filter :authenticate_user!, :check_self_request, only: [:follow, :stop_following]

  def show
    @following = current_user.following?(@user) if user_signed_in?
    @pictures = Picture.latest.includes(:user).where(user: @user)
  end

  def update
    @user.assign_attributes(permitted_params)
    @user.save
    respond_with(@user)
  end

  def follow
    current_user.follow(@user)
    render json: { state: :active }
  end

  def stop_following
    current_user.stop_following(@user)
    render json: { state: :inactive}
  end

  def avatar_edit
    render 'avatar_edit'
  end

  def avatar_update
    # avatar should be changed after crop parameters filled in,
    # otherwise it would not crop the picture
    @user.crop_x = permitted_params[:crop_x]
    @user.crop_y = permitted_params[:crop_y]
    @user.crop_h = permitted_params[:crop_h]
    @user.crop_w = permitted_params[:crop_w]
    @user.avatar = permitted_params[:avatar]
    flash[:notice] = I18n.t('user.avatar_update') if @user.save
    respond_with(@user)
  end

  private

  def set_model
    @user = User.find(params[:id])
  end

  def check_self_request
    render json: { state: :inactive } if current_user == @user
  end

  def permitted_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :city, :vk, :avatar, :crop_x, :crop_y, :crop_w, :crop_h)
  end
end
