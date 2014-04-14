class PicturesController < InheritedResources::Base
  PAGE_SIZE = 15
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :like, :unlike]
  before_filter :set_like_parameters, only: :show, if: :user_signed_in?

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

  private

  def set_like_parameters
    @voted = current_user.liked?(resource)
    @following = current_user.following?(resource)
  end

  helper_method :page, :fetch_path, :collection

  def permitted_params
    params.require(:picture).permit(
      :crop_x,
      :crop_y,
      :crop_h,
      :crop_w,
      :name,
      :description,
      :path,
      :tag_list
    ).tap do |whitelist|
      whitelist[:user_id] = current_user.id
    end.permit!
  end

  def page
    @page ||= (params[:page] || 1).to_i
  end

  def fetch_path
    url_for([parent, :pictures], order: 'created_at')
  end

  def collection
    @collection ||= begin
                      offset = page * PAGE_SIZE
                      end_of_association_chain.includes(:user).limit(PAGE_SIZE).offset(offset)
                    end
  end
end
