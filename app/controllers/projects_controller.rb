class ProjectsController < ActionController::Base
  PAGE_SIZE = 25
  respond_to :json

  def index
    @projects = collection
    respond_with @projects
  end

  private

  def order
    return({ params[:order] => :desc, id: :desc }) if Picture.column_names.include?(params[:order])

    { created_at: :desc }
  end

  def collection
    offset = page * PAGE_SIZE

    Picture.includes(:user).limit(PAGE_SIZE).offset(offset).order(order)
  end

  def page
    @page ||= (params[:page] || 0).to_i
  end
end
