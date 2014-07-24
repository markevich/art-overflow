class PicturesController < InheritedResources::Base
  belongs_to :user, :album, polymorphic: true

  PAGE_SIZE = 15
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :like, :unlike]
  before_action :increase_view_count, only: [:show]

  load_and_authorize_resource :user
  load_and_authorize_resource :picture, through: :user

  belongs_to :user, optional: true
  resources_configuration[:user][:finder] = :friendly_find

  def index
    respond_with do |format|
      format.html do
        if request.xhr?
          render collection
        end
      end
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
      :path_cache,
      category_ids: []
    ]).tap do |whitelist|
      whitelist[:picture] ||= {}
      whitelist[:picture][:user_id] = current_user.id
    end.permit!
  end

  private

  def tags
    params.fetch(:tags, '').split(',')
  end

  def increase_view_count
    Picture.increment_counter(:view_count, resource.id)
  end

  def smart_collection_url
    user_pictures_path(resource.user)
  end

  def page
    @page ||= (params[:page] || 1).to_i
  end

  def order
    return({ params[:order] => :desc, id: :desc }) if Picture.column_names.include?(params[:order])

    { created_at: :desc }
  end

  def collection
    @collection ||= begin
      offset = (page - 1) * PAGE_SIZE

      result = end_of_association_chain.includes(:user).limit(PAGE_SIZE).offset(offset).order(order)
      result = result.includes(:categories).where(categories: { id: params[:category] }) if params[:category]
      result = result.tagged_with(tags, :on => :tags, any: true) if tags.any?
      result
    end
  end
end
