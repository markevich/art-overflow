class UsersController < InheritedResources::Base
  before_filter :authenticate_user!, only: [:edit, :update, :follow, :stop_following]

  actions :all, except: [:index, :show]

  def follow
    current_user.follow(resource)
    render json: { state: :active }
  end

  def stop_following
    current_user.stop_following(resource)
    render json: { state: :inactive}
  end

  def avatar_edit
    render 'avatar_edit'
  end

  def avatar_update
    # avatar should be changed after crop parameters filled in,
    # otherwise it would not crop the picture
    resource.crop_x = permitted_params[:crop_x]
    resource.crop_y = permitted_params[:crop_y]
    resource.crop_h = permitted_params[:crop_h]
    resource.crop_w = permitted_params[:crop_w]
    resource.avatar = permitted_params[:avatar]
    flash[:notice] = I18n.t('user.avatar_update') if resource.save
    respond_with(resource)
  end

  private

  def permitted_params
    params.permit(user:[
      :name, :email, :password, :password_confirmation,
      :city, :vk, :avatar, :crop_x, :crop_y, :crop_w, :crop_h
    ])
  end
end
