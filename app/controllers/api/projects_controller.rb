module Api
  class ProjectsController < ActionController::Base
    PAGE_SIZE = 25
    respond_to :json

    def index
      @projects = collection
      respond_with @projects
    end

    def show
      @project = Picture.includes(:user, :categories, :tags, :emotions).find(params[:id])
      @more_projects_by_user = @project.user.pictures.where.not(id: @project.id).order(likes_count: :desc).limit(3)
      @emotions = @project.emotions.group_by { |e| e.type }
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
