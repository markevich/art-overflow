module Api
  class ProjectsController < ActionController::Base
    PAGE_SIZE = 25
    respond_to :json

    def index
      @projects = collection
      respond_with @projects
    end

    def show
      @project = Picture.includes(:user, :categories, :tags).find(params[:id])
    end

    private

    def order
      return({ params[:order] => :desc, id: :desc }) if Picture.column_names.include?(params[:order])

      { created_at: :desc }
    end

    def categories
    end

    def collection
      offset = page * PAGE_SIZE

      result = Picture.includes(:user)
      result = result.includes(:categories).where(categories: { name: params[:categories] }) if params[:categories].present?
      result.limit(PAGE_SIZE).offset(offset).order(order)
    end

    def page
      @page ||= (params[:page] || 0).to_i
    end
  end
end
