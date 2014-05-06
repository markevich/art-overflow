class UserAvatarController < InheritedResources::Base
  before_action :authenticate_user!
  actions [:new, :create]

  private

  def permitted_params
    params.permit(user_avatar: [
      :image,
      :crop_x,
      :crop_y,
      :crop_h,
      :crop_w,
    ])
  end
end
