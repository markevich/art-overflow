class AlbumAvatarsController < InheritedResources::Base
  before_action :authenticate_user!

  defaults resource_class: Album, collection_name: 'albums', instance_name: 'album'
  load_and_authorize_resource

  actions :update, :edit

  def smart_resource_url
    url_for([current_user, :albums])
  end

  private

  def permitted_params
    params.permit(album: [
      :crop_x,
      :crop_y,
      :crop_h,
      :crop_w,
      :avatar,
    ])
  end
end
