class PicturesController < InheritedResources::Base
  belongs_to :user, :album, polymorphic: true

  PAGE_SIZE = 15
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :like, :unlike]

  load_and_authorize_resource :user
  load_and_authorize_resource :picture, through: :user

  belongs_to :user, optional: true

  def index
    respond_with do |format|
      format.html do
        if request.xhr?
          render collection
        end
      end
    end
  end

  def like
    if current_user.like(resource)
      render json: { count: resource.reload.likes_count, state: :active }
    else
      render json: { count: resource.reload.likes_count, message: 'fail', state: :inactive}
    end
  end

  def unlike
    if current_user.unlike(resource)
      render json: { count: resource.reload.likes_count, state: :inactive }
    else
      render json: { count: resource.reload.likes_count, message: 'fail', state: :active}
    end
  end

  helper_method :page, :order, :collection

  def permitted_params
    params.permit(picture:
    [
      :crop_x,
      :crop_y,
      :crop_h,
      :crop_w,
      :name,
      :description,
      :album_id,
      :path,
      :tag_list,
      :path_cache
    ]).tap do |whitelist|
      whitelist[:picture] ||= {}
      whitelist[:picture][:user_id] = current_user.id
    end.permit!
  end

  private

  def smart_collection_url
    user_pictures_path(resource.user)
  end

  def page
    @page ||= (params[:page] || 1).to_i
  end

  def order
    return({ params[:order] => :desc }) if Picture.column_names.include?(params[:order])

    { created_at: :desc }
  end

  def collection
    @collection ||= begin
      offset = (page - 1) * PAGE_SIZE

      end_of_association_chain.includes(:user).limit(PAGE_SIZE).offset(offset).order(order)
    end
  end
end
