class AlbumAvatarsController < InheritedResources::Base
  before_action :authenticate_user!

  defaults resource_class: Album, collection_name: 'albums', instance_name: 'album'

  actions :update, :edit

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
