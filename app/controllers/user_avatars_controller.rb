class UserAvatarsController < InheritedResources::Base
  before_action :authenticate_user!

  defaults resource_class: User, collection_name: 'users', instance_name: 'user'

  actions :update, :edit

  def smart_resource_url
    url_for([current_user, :pictures])
  end

  private

  def permitted_params
    params.permit(user: [
      :crop_x,
      :crop_y,
      :crop_h,
      :crop_w,
      :avatar,
    ])
  end
end
