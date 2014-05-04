class AlbumsController < InheritedResources::Base
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  belongs_to :user

  PAGE_SIZE = 15

  def index
    respond_with do |format|
      format.html do
        if request.xhr?
          render collection
        end
      end
    end
  end

  def create
    resource = current_user.albums.build(permitted_params[:album])

    if resource.save
      flash[:notice] = I18n.t('flash.actions.create.notice', resource_name: Album.model_name.human)
      render js: "window.location = '#{url_for([current_user, :albums])}'"
    else
      render(template: 'albums/new', locals: { resource: resource }, layout: false, status: 422)
    end
  end

  private

  def smart_resource_url
    url_for([parent, :albums])
  end

  helper_method :page, :order, :collection

  def page
    @page ||= (params[:page] || 1).to_i
  end

  def order
    return({ params[:order] => :desc }) if Album.column_names.include?(params[:order])

    { created_at: :desc }
  end

  def collection
    @collection ||= begin
      offset = (page - 1) * PAGE_SIZE

      end_of_association_chain.includes(:user).limit(PAGE_SIZE).offset(offset).order(order)
    end
  end

  def permitted_params
    params.permit(album: [
      :name, :description
    ]).tap do |whitelist|
      whitelist[:album] ||= {}
      whitelist[:album][:user_id] = current_user.id
    end.permit!
  end
end
